<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<title>Inicio</title>

	<style >

		.div{
			margin: auto;
			width: 500px;
			height: 200px;
			background-color: white; 
			 border-radius: 20px;
		}
		.div2{
			margin: auto;
			width: 400px;
			height: 100px;
			background-color: white; 
		}

		.body {
  			background: #EC610B;
 			 min-height: 100vh;
		}

		.h2 {
  			text-align: center;
  			margin: 0px auto;
  			margin-bottom: 10px;
  			font-family: Arial Black;
		}


		.boton{
             background-color: #FFDA63;
             border: none;
             color: black;
             padding: 15px 32px;
             text-align: center;
             text-decoration: none;
             display: inline-block;  
             font-size:20px;
             font-family: Arial Black;
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
	<br>
	<br>
	<br>
	<br>
	<br> <br> <br> <br>

    <?php
        $idEmpleado = 0;
        if (isset($_GET['id']))
        {
            $idEmpleado = $_GET['id'];

            if ($idEmpleado == 0)
            {
                ?>
                <script language="JavaScript">
					window.location='index.php'
				</script>
                <?php
            }
        }
        
    ?>
	<div class="div">
	    	<br>
       		<h2 class="h2">Menú Principal</h2>
       		 <br>
        	<div class="div2">
        		<br>
        		<button class="boton" onclick="location.href='MostrarMesesPlanilla.php?id=<?php echo $idEmpleado ?>'">&#128188 Mes</button>

        		<button class="boton botonAzul" onclick="location.href='MostrarEmpleados.php'">&#128119Empleados</button>
    	</div>
    </div>
	
</body>

</html>