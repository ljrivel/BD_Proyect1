
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<title>Puestos</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="generator" content="Geany 1.36" />
</head>

<body>
	<button onclick="location.href='menu.php'">Menú</button>
	<center>
	
	<h1>Lista de puestos registrados</h1>	
	<table border="2">
		<tr>
			<th>ID</th>
			<th>Nombre</th>
			<th>Salario por hora</th>
			<th></th>
			<th></th>
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
			<td align='center' ><?php echo $id ?></td>
			<td align='center'><?php echo $nombre ?></td>
			<td align='center'><?php echo $salario ?></td>
			<!--<td align='center'><a href="EditarPuesto.php?id=<?php #echo "$id&nombre=$nombre&salario=$salario"; ?>">Editar</a></td>-->
			<td align='center'><button onclick="location.href='EditarPuesto.php?id=<?php echo "$id&nombre=$nombre&salario=$salario"; ?>'">Editar</button></td>
			<td align='center'><button onclick="location.href='MostrarPuestos.php?eliminar=<?php echo $id ?>'">Eliminar</button></td>
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
	<button onclick="location.href='AddPuesto.php'">Agregar Puesto</button><br>
	</center>
</body>

</html>
