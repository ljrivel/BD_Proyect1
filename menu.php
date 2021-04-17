<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<title>Inicio</title>

	<style >
		.body {
  			background: #EC610B;
 			 min-height: 100vh;
		}

		.h2 {
  			text-align: center;
  			margin: 0px auto;
  			margin-bottom: 10px;
  			color: rgba(0, 0, 0, 0.5);
  			font-family: Arial Black;
		}

		.form {
 			 margin: auto;
  			width: 50%;
  			max-width: 500px;
  			background: #F3F3F3;
  			padding: 20px;
  			border: 1px solid rgba(0, 0, 0, 0.2);
		}

		.boton{
             background-color: #FFDA63;
             border: none;
             color: black;
             padding: 15px 32px;
             text-align: center;
             text-decoration: none;
             display: inline-block;  
             font-size:22px;
             font-family: Arial;
  			 border-radius: 20px;
             margin: 0px auto;
         }
		.botonAzul{
             background-color: #008CBA;
		}

	</style>

</head>

<body class="body">
	    <br>
        <h2 class="h2">Menú Principal</h2>
        <br>
        <button class="boton" onclick="location.href='MostrarPuestos.php'">Puestos &#128273</button>
        <button class="boton botonAzul" onclick="location.href='MostrarEmpleados.php'">&#128119Empleados</button>

	
</body>

</html>