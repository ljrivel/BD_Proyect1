<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<title>Agregar Puesto</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="generator" content="Geany 1.36" />
		<style >

		.body {
  			background: #EC610B;
 			 min-height: 100vh;
		}

		form {
  			margin: auto;
 			width: 50%;
  			max-width: 500px;
  			background: #F3F3F3;
  			padding: 20px;
  			border: 1px solid rgba(0, 0, 0, 0.2);
		}

		.h1 {
  			text-align: center;
  			margin: 0px auto;
  			margin-bottom: 10px;
  			  color: rgba(0, 0, 0, 0.8);
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
			padding: 0px 25px;
			font-size:25px;
			background-color: #09CA76;
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


		select {
  			display: block;
  			padding: 6px;
  			width: 74%;
  			margin: 0px auto;
  			font-size: 15px;
		}

		input {
  			display: block;
  			padding: 6px;
  			width: 70%;
  			margin: 0px auto;
  			font-size: 15px;
		}

		input[type="submit"] {
  			background: linear-gradient(#FFDA63, #FFB940);
  			border: 0;
  			color: black;
  			opacity: 0.8;
  			cursor: pointer;
   			font-family: Arial black;
  			border-radius: 20px;
  			margin-bottom: 0;
		}

		input[type="submit"]:hover {
  			opacity: 1;
		}

		input[type="submit"]:active {
  			transform: scale(0.95);	
		}


	</style>
    
</head>

<body class="body">
	<center>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>	
		<?php
			include 'Conexion.php';

			$conexion = Conexion::conectar();
			$conn = $conexion::$con;
        
		?>
		<form action="" method="post">
		<!--Se debe agregar un while para añadir las opciones-->
			<h1 class="h1">Agregar puesto</h1>

            Nombre:<br>
			<input value="" maxlength="40" type="text" name="nombre" required/>
            <br><br>
			
			Salario por hora:<br>
			<input value="" type="number" name="salario" required/>
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
                echo "<script> ; window.location='MostrarPuestos.php' </script>";
			}

            


			
		?>
	</center>
</body>

</html>