<?php
	$serverName = 'LAPTOP-L1B3GS1L';
	
	$connectionInfo = array('Database'=>'Planilla_Empleados', 'UID'=>'sa', 'PWD'=>'1234', 'CharacterSet'=>'UTF-8');
	
	$con = sqlsrv_connect($serverName, $connectionInfo);
	
	if ($con){
		#echo 'Conexión establecida';
		return $con; 
	}
	else{
		echo 'Error de conexión.';
    }
?>
