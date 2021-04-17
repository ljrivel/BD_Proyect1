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
			width: 1020px;
			height: 1100px;
			background-color: white; 
			border-radius: 20px;
		}
		.div2{
			margin: 1px 662px;
			width: 470px;
			height: 100px;
			background-color: none; 
		}
		.minidiv{
			margin: 0px 1306px;
			width: 100px;
			height: 28px;
			background-color: none	; 
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
			padding: 2px 35px;
			background-color: #83CA09;
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




	</style>
</head>

<body class = "body">
	
	<center>
	
	<div class="minidiv">
		<br>
		<br>
		<button class="boton menu" onclick="location.href='menu.php'">Menú</button>
	</div>
	<div class="div">
		<br>
		<h1 class="h2">Lista de empleados registrados</h1>	

		<form action="" method="post">
			<input class="barra" value="" maxlength="40" type="text" name="str">
			<input class= "boton" value="Filtrar" type="submit" name="Filtrar"><br>
		</form>
			<table class="tabla" border="2">
			<br>
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
			<td align='center'><button class="emojis" onclick="location.href='EditarEmpleado.php?id=<?php echo "$id&tipo=$tipoDoc&identificacion=$identificacion&nombre=$nombre&puesto=$puesto&dep=$departamento&fecha=$fecha"; ?>'">&#9997</button></td>
			<td align='center'><button class="emojis"> onclick="location.href='MostrarEmpleados.php?eliminar=<?php echo $id ?>'">&#10060</button></td>
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

		<div class="div2">
			<button class="boton agregar" onclick="location.href='AddEmpleado.php'">Agregar Empleado</button><br>
			
		</div>
    	<br>
		</center>
	</div>

		

</body>

</html>