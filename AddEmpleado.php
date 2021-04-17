<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<title>Agregar Empleado</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="generator" content="Geany 1.36" />
</head>

<body>
	<center>
		<?php
		$conn = include "Conexion.php";
		?>
		<form action="AddEmpleado.php" method="post">
		<!--Se debe agregar un while para añadir las opciones-->
			<h1>Agregar empleado</h1>
			Tipo de identificación:<br>
			<select name="tipoDocId" id="tipoDocId">
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
			<input maxlength="20" placeHolder="Identificación" type="number" name="valorDocId" required/><br><br>
			
			Nombre completo:<br>
			<input maxlength="64" placeHolder="Nombre completo" type="text" name="nombre" required/><br><br>

			Fecha de nacimiento<br><input type="date" name="fechaNacimiento" pattern="\d{4}/\d{2}/\d{2}" required\><br><br> <!--pattern="\d{4}-\d{2}-\d{2}"-->
			
			Puesto:<br>
			<select name="puesto" id="puesto">
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

				header("Location: MostrarEmpleados.php");
			}


			
		?>
	</center>
</body>

</html>
