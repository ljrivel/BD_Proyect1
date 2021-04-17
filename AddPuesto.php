<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<title>Agregar Puesto</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="generator" content="Geany 1.36" />
    
</head>

<body>
	<center>
		<?php
		$conn = include "Conexion.php";
        
		?>
		<form action="" method="post">
		<!--Se debe agregar un while para añadir las opciones-->
			<h1>Agregar puesto</h1>

            Nombre:<br>
			<input value="" maxlength="40" type="text" name="nombre" required/>
            <br><br>
			
			Salario por hora:<br>
			<input value="" type="number" name="salario" required/>
            <br><br>

			<br><br>
			
			<input value="Agregar puesto" type="submit" name="AddPuesto"><br>
		</form>
		
        
		
		<?php
        
			if(isset($_POST["AddPuesto"])){
				
                $salario = $_POST['salario'];
                $nombre = $_POST['nombre'];
                $query = "EXEC Add_Puesto $nombre, $salario"; 
                #echo "$query";

                $exec = sqlsrv_query($conn, $query);
                header("Location: MostrarPuestos.php");
			}

            


			
		?>
	</center>
</body>

</html>