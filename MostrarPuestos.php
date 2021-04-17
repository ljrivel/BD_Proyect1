
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<title>Puestos</title>
	<style >

		.div{
			margin: auto;
			width: 600px;
			height: 700px;
			background-color: white; 
			border-radius: 20px;
		}
		.div2{
			margin: 3px 269px;
			width: 470px;
			height: 100px;
			background-color: none; 
		}
		.minidiv{
			margin: 0px 638px;
			width: 100px;
			height: 28px;
			background-color: none; 
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
			font-size:14px;
			padding: 1px 10px;
		}

		.menu{
			padding: 0px 20px;
			font-size:22px;
			background-color: #09CA76;
		}

		.tabla{
			width: 550px;
			font-family: Arial;
			font-size: 15px;
			border-color: white;
			
		}

		.subtabla{
			background-color: white; 
			margin: 0px 0px;
			border-color: black;
			border-width: 0px;
		}


		.encabezado{
			background-color:#FFDA63;
			border-color: black;
			border-width: 0px;
			
		}

		.emojis{
			border-color: white	;
			font-size:16px;
			background-color: white; 
		}

	</style>
</head>

<body class="body">
	

	<br>
	<br>
	<br>
	<br>

	<div class="minidiv">
		<br>
		<br>
		<button class="boton menu" onclick="location.href='menu.php'">&#127968</button>
	</div>

	<center>


	
	<div class="div">
	<br>
	<h1>Lista de puestos registrados</h1>

	<table class="tabla" border="2">
		<tr>
			<th class="subtabla encabezado">ID</th>
			<th class="subtabla encabezado">Nombre</th>
			<th class="subtabla encabezado ">Salario por hora</th>
			<th class="subtabla encabezado"></th>
			<th class="subtabla encabezado"></th>
		</tr>


		<tr>
			<td class="subtabla" align='center' >1</td>
			<td class="subtabla" align='center'>Marketing</td>
			<td class="subtabla" align='center'>2000</td>
			<!--<td align='center'><a href="EditarPuesto.php?id=<?php #echo "$id&nombre=$nombre&salario=$salario"; ?>">Editar</a></td>-->
			<td class="subtabla" align='center'><button  class="emojis" onclick="location.href='EditarPuesto.php?id=<?php echo "$id&nombre=$nombre&salario=$salario"; ?>'">&#9997</button></td>
			<td class="subtabla" align='center'><button  class="emojis" onclick="location.href='MostrarPuestos.php?eliminar=<?php echo $id ?>'">&#10060</button></td>
		</tr>

		<tr>
			<td class="subtabla" align='center' >1</td>
			<td class="subtabla" align='center'>Marketing</td>
			<td class="subtabla" align='center'>2000</td>
			<!--<td align='center'><a href="EditarPuesto.php?id=<?php #echo "$id&nombre=$nombre&salario=$salario"; ?>">Editar</a></td>-->
			<td class="subtabla" align='center'><button  class="emojis" onclick="location.href='EditarPuesto.php?id=<?php echo "$id&nombre=$nombre&salario=$salario"; ?>'">&#9997</button></td>
			<td class="subtabla" align='center'><button  class="emojis" onclick="location.href='MostrarPuestos.php?eliminar=<?php echo $id ?>'">&#10060</button></td>
		</tr>
		<tr>
			<td class="subtabla" align='center' >1</td>
			<td class="subtabla" align='center'>Marketing</td>
			<td class="subtabla" align='center'>2000</td>
			<!--<td align='center'><a href="EditarPuesto.php?id=<?php #echo "$id&nombre=$nombre&salario=$salario"; ?>">Editar</a></td>-->
			<td class="subtabla" align='center'><button  class="emojis" onclick="location.href='EditarPuesto.php?id=<?php echo "$id&nombre=$nombre&salario=$salario"; ?>'">&#9997</button></td>
			<td class="subtabla" align='center'><button  class="emojis" onclick="location.href='MostrarPuestos.php?eliminar=<?php echo $id ?>'">&#10060</button></td>
		</tr>
	<?php
	function borrar()
	{
		echo "Hola";
	}
		$conn = include 'Conexion.php';
		
		$query = 'EXEC dbo.Mostrar_Puestos';
		$exec = sqlsrv_query($conn, $query);
		
		while ($registro = sqlsrv_fetch_array($exec)){
			$id = $registro['Id'];
			$nombre = $registro['Nombre'];
			$salario = $registro['SalarioxHora'];
	?>
			<tr>
			<td class="subtabla" align='center' ><?php echo $id ?></td>
			<td class="subtabla" align='center'><?php echo $nombre ?></td>
			<td class="subtabla" align='center'><?php echo $salario ?></td>
			<!--<td align='center'><a href="EditarPuesto.php?id=<?php #echo "$id&nombre=$nombre&salario=$salario"; ?>">Editar</a></td>-->
			<td class="subtabla" align='center'><button  class="emojis" onclick="location.href='EditarPuesto.php?id=<?php echo "$id&nombre=$nombre&salario=$salario"; ?>'">&#9997</button></td>
			<td class="subtabla" align='center'><button  class="emojis" onclick="location.href='MostrarPuestos.php?eliminar=<?php echo $id ?>'">&#10060</button></td>
			</tr>
	<?php
		}

		if(isset($_GET['eliminar']))
		{
			$id = $_GET['eliminar'];
			
			$query = "EXEC Borrar_Puesto $id";

			$exec = sqlsrv_query($conn, $query);

			header("Location: MostrarPuestos.php");
		}
	?>
	</table>

	<div class="div2">
			<button class="boton agregar" onclick="location.href='AddPuesto.php'">Agregar Puesto</button><br>
	</div>
	
	</center>
</div>
</body>

</html>
