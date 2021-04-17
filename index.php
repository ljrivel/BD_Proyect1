<?php


?>
<!DOCTYPE html PUBLIC 

<html>

<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="login.css">
</head>

<body>
<form method="post">
<h2>Iniciar sesión</h2>
<input type="text" placeholder="&#128273; Usuario" name="usuario" required>
<input type="password" placeholder="&#128274; Contraseña" name="pass" required>
<input type="submit" name="Ingresar" value="Ingresar">


<?php
	if(isset($_POST['Ingresar']))
	{

		$conn = include 'Conexion.php';
		$username = $_POST['usuario'];
		$pass = $_POST['pass'];

		$query = "EXEC Datos_Usuarios $username, $pass";

		$exec = sqlsrv_query($conn, $query);

		#echo "$username $pass";

		$registro = sqlsrv_fetch_array($exec);

		if($registro[0] == 1){
			echo "<script> alert('Bienvenido $username'); window.location='menu.php' </script>";
		}

		else{
			echo "<script> alert('Usuario no existe'); window.location='index.php' </script>";
		}



		#header("Location: menu.php");

	}
?>
</form>
</body>
</html>
