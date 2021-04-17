<?php


$nombre = $_POST["usuario"];
$pass   = $_POST["pass"];


//Login

	$con = include 'Conexion.php';

	$query = 'EXEC dbo.Datos_Usuarios $nombre $pass';

	$exec2 = sqlsrv_query($con, $query);

	if($exec2==0)
	{
		echo "<script> alert('Bienvenido $nombre'); window.location='menu.php' </script>";
	}else
	{
		echo "<script> alert('Usuario no existe'); window.location='index.php' </script>";
	}
	

	






?>