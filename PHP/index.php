<?php


?>
<!DOCTYPE html PUBLIC 

<html>

<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="../CSS/login.css">
</head>

<body>
<form method="POST">
<h2>Iniciar sesión</h2>
<input type="text" placeholder="&#128273; Usuario" name="usuario" required>
<input type="password" placeholder="&#128274; Contraseña" name="pass" required>
<input type="submit" name="Ingresar" value="Ingresar">
</form>

<?php
	if(isset($_POST['Ingresar']))
	{

		include 'Conexion.php';

		$conexion = Conexion::conectar();
		$conn = $conexion::$con;
		
		$username = $_POST['usuario'];
		$pass = $_POST['pass'];

		$query = "EXEC Datos_Usuarios $username, $pass";

		$exec = sqlsrv_query($conn, $query);

		$registro = sqlsrv_fetch_array($exec);

		if($registro[0] == 1){
			?>
			<script language="JavaScript">
				window.location='menu.php'
			</script>
			<?php
		}

		else{
			?>
			<script language="JavaScript">
				alert('Datos incorrectos, intente de nuevo');
			</script>
			<?php
		}
	}
?>
</body>
</html>
