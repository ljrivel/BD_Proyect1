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

		$query = "EXEC LogInEmpleado $username, $pass, 0";

		$exec = sqlsrv_query($conn, $query);

		$registro = sqlsrv_fetch_array($exec);
		echo $registro[0];
		
		try 
		{
			if($registro != null && count($registro) > 0)
			{
				//echo $registro['Id'];
				
				?>
				<script language="JavaScript">
					window.location='MenuPrincipalEmpleado.php?id=<?php echo $registro['Id'] ?>'
				</script>
				<?php
				
			}
			else
			{
				?>
				<script language="JavaScript">
					alert('Datos incorrectos, intente de nuevo');
				</script>
				<?php
			}
		}
		catch (Exception $e)
		{
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
