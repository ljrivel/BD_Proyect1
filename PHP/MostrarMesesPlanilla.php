<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<title>Empleados</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="generator" content="Geany 1.36" />
	<style >

		.div{
			margin: auto;
			width: 1020px;
			height: 1100px;
			background-color: white; 
			border-radius: 20px;
		}
		.div2{
			margin: 3px 662px;
			width: 470px;
			height: 100px;
			background-color: none; 
		}
		.minidiv{
			margin: 0px 175px;
			width: 100px;
			height: 28px;
			background-color: none	; 
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
			font-size:18px;
			background-color: white; 
		}

	</style>
</head>

<body class = "body">
	
	<center>
	

	<div class="div">
		<br>
		<h1 class="h2">Últimos meses</h1>	

			<table class="tabla" border="2">
			<br>
		<tr>
			<th class="subtabla encabezado">Salario Bruto</th>
			<th class="subtabla encabezado">Salario Neto</th>
            <th class="subtabla encabezado">Total deducciones</th>
		</tr>


	<?php
		include 'Conexion.php';

		$conexion = Conexion::conectar();
		$conn = $conexion::$con;
		$query = "";
        $idEmpleado = 0;
		if (isset($_GET['id'])){

			$idEmpleado = $_GET['id'];
			$query = "EXEC dbo.ConsultarMeses $idEmpleado, 0";

		}
		
		$exec = sqlsrv_query($conn, $query);
		
		while ($registro = sqlsrv_fetch_array($exec)){
			$salarioBruto = $registro['SalarioBruto'];
            $salarioNeto = $registro['SalarioNeto'];
            $deducciones = $registro['TotalDeducciones'];
            $idMesPlanilla = $registro['IdMesPlanilla'];
	?>
			<tr>

			<td class="subtabla"  align='center' ><?php echo $salarioBruto ?></td>
            <td class="subtabla"  align='center' ><?php echo $salarioNeto ?></td>
			<td class="subtabla"  align='center'>
            <button class="emojis" onclick="location.href='MostrarDeduccionesMes.php?id=<?php echo "$idEmpleado&idMes=$idMesPlanilla"; ?>'"; ?><?php echo $deducciones ?></button></td>
            </tr>
            
	<?php
		}    

	?>
		</table>
    	<br>
		</center>
	</div>

		

</body>

</html>