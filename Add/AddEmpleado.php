<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<title>Agregar Empleado</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="generator" content="Geany 1.36" />
	<style >

		.body {
  			background: #EC610B;
 			 min-height: 100vh;
		}

		form {
  			margin: auto;
 			width: 50%;
  			max-width: 500px;
  			background: #F3F3F3;
  			padding: 20px;
  			border: 1px solid rgba(0, 0, 0, 0.2);
		}

		.h1 {
  			text-align: center;
  			margin: 0px auto;
  			margin-bottom: 10px;
  			  color: rgba(0, 0, 0, 0.8);
  			font-family: Arial Black;
		}

		.barra{
			width: 880px;
			height: 18px;
		}

		.boton{
			background-color: #FFDA63;
             color: black;
             border-color: rgba(0, 0, 0, 0.5);
             padding: 1px 15px;
             text-align: center;
             text-decoration: none;
             display: inline-block;  
             font-size:15px;
             font-family: Arial black;
  			 border-radius: 8px;

             margin: 0px auto;
		}

		.agregar{
			font-size:17px;
			padding: 1px 16px;
		}

		.menu{
			padding: 0px 25px;
			font-size:25px;
			background-color: #09CA76;
		}

		.tabla{
			width: 980px;
			font-family: Arial;
			font-size: 15px;

		}
		.emojis{
			border-color: white	;
			font-size:18px;
			background-color: white; 
		}


		select {
  			display: block;
  			padding: 6px;
  			width: 74%;
  			margin: 0px auto;
  			font-size: 15px;
		}

		input {
  			display: block;
  			padding: 6px;
  			width: 70%;
  			margin: 0px auto;
  			font-size: 15px;
		}

		input[type="submit"] {
  			background: linear-gradient(#FFDA63, #FFB940);
  			border: 0;
  			color: black;
  			opacity: 0.8;
  			cursor: pointer;
   			font-family: Arial black;
  			border-radius: 20px;
  			margin-bottom: 0;
		}

		input[type="submit"]:hover {
  			opacity: 1;
		}

		input[type="submit"]:active {
  			transform: scale(0.95);	
		}


	</style>
</head>

<body class="body">

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<center>
		<?php
		$conn = include "Conexion.php";
		?>
		<form action="AddEmpleado.php" method="post">
		<!--Se debe agregar un while para añadir las opciones-->
			<h1 class=" h1">Agregar empleado</h1>
			Tipo de identificación:<br>
			<select  name="tipoDocId" id="tipoDocId">
			<?php
				$query = 'EXEC dbo.Mostrar_TipoDocID';
				$exec = sqlsrv_query($conn, $query);
				$tiposDocId = Array();
				while ($registro = sqlsrv_fetch_array($exec)){
					$id = $registro['Id'];
					$nombre = $registro['Nombre']?>
					<option value="<?php echo $id ?>"><?php echo $nombre ?></option>
				<?php
				}
				?>
			</select>
			<br><br>
			
			Identificación:<br>
			<input max="999999999" placeHolder="&#128179 Identificación" type="number" name="valorDocId" required/><br><br>
			
			Nombre completo:<br>
			<input maxlength="64" placeHolder="&#X1F464 Nombre completo" type="text" name="nombre" required/><br><br>

			Fecha de nacimiento<br>
			<input type="date" name=" fechaNacimiento" pattern="\d{4}/\d{2}/\d{2}" required/><br><br> <!--pattern="\d{4}-\d{2}-\d{2}"-->
			
			Puesto:<br>
			<select name="puesto"  id="puesto">
				<?php
				$query = 'EXEC dbo.Mostrar_Puestos';
				$exec = sqlsrv_query($conn, $query);
				$puestos = Array();
				while ($registro = sqlsrv_fetch_array($exec)){
					$id = $registro['Id'];
					$nombre = $registro['Nombre']?>
					<option value="<?php echo $id ?>"><?php echo $nombre ?></option>
				<?php
				}
				?>
				
			</select>
			<br><br>
			
			Departamento:<br>
			<select name="departamento" id="departamento">
			<?php
				$query = 'EXEC dbo.Mostrar_Departamentos';
				$exec = sqlsrv_query($conn, $query);
				$departamentos = Array();
				while ($registro = sqlsrv_fetch_array($exec)){
					$id = $registro['Id'];
					$nombre = $registro['Nombre']?>
					<option value="<?php echo $id ?>"><?php echo $nombre ?></option>
				<?php
				}
				?>
			</select>
			<br><br>
			
			<input value="Agregar empleado" type="submit" name="botonAddEmpleado"><br>
		</form>
		
		
		<?php
			if(isset($_POST["botonAddEmpleado"])){
				$idTipoId = $_POST["tipoDocId"];
				$idPuesto = $_POST["puesto"];
				$idDepartamento = $_POST["departamento"];
				$valorId = $_POST["valorDocId"];
				$nombre = $_POST["nombre"];
				$fechaNacimiento = $_POST["fechaNacimiento"];

				$query = "EXEC Add_Empleado $idTipoId, $idPuesto, $idDepartamento, $valorId, \"$nombre\",\"$fechaNacimiento\"";
				#echo $query;

				$exec = sqlsrv_query($conn, $query);
				/*
				echo "ID tipoDoc: $idTipoId <br>";
				echo "ID puesto: $idPuesto <br>";
				echo "ID apartamento $idDepartamento <br>";
				echo "Valor ID $valorId <br>";
				echo "Nombre $nombre <br>";
				echo "Nacimiento: $fechaNacimiento <br>";
				*/

				echo "<script> ; window.location='MostrarEmpleados.php' </script>";
			}


			
		?>
	</center>
</body>

</html>
