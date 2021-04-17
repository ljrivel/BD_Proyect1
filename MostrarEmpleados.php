<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<title>Empleados</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="generator" content="Geany 1.36" />
	<style >

		.div{
			margin: auto;
			width: 800px;
			height: 800px;
			background-color: white; 
			border-radius: 20px;
		}
		.div2{
			margin: auto;
			width: 390px;
			height: 100px;
			background-color: white; 
		}

		.body {
  			background: #EC610B;
 			 min-height: 100vh;
		}

		.h2 {
  			text-align: center;
  			margin: 0px auto;
  			margin-bottom: 10px;
  			color: black;
  			font-family: Arial Black;
		}

		.barra{
			width: 400px;
			height: 18px;
		}

		.input{
			background-color: #FFDA63;
             border: none;
             color: black;
             padding: 6px 15px;
             text-align: center;
             text-decoration: none;
             display: inline-block;  
             font-size:15px;
             font-family: Arial;
  			 border-radius: 20px;

             margin: 0px auto;
		}

		.tabla{
			width: 750px;
			font-family: Arial;
			font-size: 15px;

		}

		.boton{
             background-color: #FFDA63;
             border: none;
             color: black;
             padding: 15px 32px;
             text-align: center;
             text-decoration: none;
             display: inline-block;  
             font-size:15px;
             font-family: Arial;
  			 border-radius: 20px;

             margin: 0px auto;
         }



	</style>
</head>

<body class = "body">
	<button class="boton" onclick="location.href='menu.php'">Menú</button>
	<center>
	
	<br><br><br>
	<div class="div">
		<br>
		<h1 class="h2">Lista de empleados registrados</h1>	

		<form action="" method="post">
			<input class="barra" value="" maxlength="40" type="text" name="str">
			<input class= "input" value="Filtrar" type="submit" name="Filtrar"><br>
		</form>

			<br>
			<table class="tabla" border="2">
		<tr>
			<th>ID</th>
            <th>Tipo de identificación</th>
            <th>Identificación</th>
			<th>Nombre</th>
			<th>Fecha de nacimiento</th>
            <th>Puesto</th>
            <th>Departamento</th>
            <th>....</th>
            <th>....</th>
		</tr>

	
	




	<?php
		$conn = include 'Conexion.php';
		$query = "";
		if (isset($_GET['filtrar'])){

			$str = $_GET['filtrar'];
			$query = "EXEC dbo.Filtrar_Empleados $str";
		}
		else{
			$query = 'EXEC dbo.Mostrar_Empleados';
		}


		
		$exec = sqlsrv_query($conn, $query);
		
		while ($registro = sqlsrv_fetch_array($exec)){
			$id = $registro['Id'];
            $tipoDoc = $registro['DocId'];
            $identificacion = $registro['ValorDocIdentidad'];
			$nombre = $registro['Nombre'];
			$fecha = $registro["FechaDeNacimiento"]->format('Y-m-d');
			$puesto = $registro['NombrePuesto'];
            $departamento = $registro['NombreDept']
	?>
			<tr>
			<td align='center' ><?php echo $id ?></td>
			<td align='center'><?php echo $tipoDoc ?></td>
			<td align='center'><?php echo $identificacion ?></td>
			<td align='center'><?php echo $nombre ?></td>
			<td align='center'><?php echo $fecha ?></td>
            <td align='center'><?php echo $puesto ?></td>
            <td align='center'><?php echo $departamento ?></td>
			<td align='center'><button onclick="location.href='EditarEmpleado.php?id=<?php echo "$id&tipo=$tipoDoc&identificacion=$identificacion&nombre=$nombre&puesto=$puesto&dep=$departamento&fecha=$fecha"; ?>'">Editar</button></td>
			<td align='center'><button onclick="location.href='MostrarEmpleados.php?eliminar=<?php echo $id ?>'">Eliminar</button></td>
			</tr>
            
	<?php
		}    

		if(isset($_GET['eliminar']))
		{
			$id = $_GET['eliminar'];
			
			$query = "EXEC Borrar_Empleado $id";

			$exec = sqlsrv_query($conn, $query);

			header("Location: MostrarEmpleados.php");
		}

		if(isset($_POST['Filtrar']))
		{
			$str = $_POST['str'];

			if ($str != ""){
				header("Location: MostrarEmpleados.php?filtrar=$str");
			}
			else{
				header("Location: MostrarEmpleados.php");
			}
			
			#echo "Se buscará $str";
		}
		
		
	?>
		</table>
    	<button onclick="location.href='AddEmpleado.php'">Agregar Empleado</button><br>
		</center>
	</div>
</body>

</html>