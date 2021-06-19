<?php

	class Conexion
	{
		private static $conexion;
		public static $con;

		private function __construct()
		{
			$serverName = 'DESKTOP-SOECLHP';
	
			$connectionInfo = array('Database'=>'Planilla_Empleados', 'UID'=>'sa', 'PWD'=>'1234', 'CharacterSet'=>'UTF-8');
	
			self::$con = sqlsrv_connect($serverName, $connectionInfo);

			if (self::$con){
				# echo 'Conexión establecida';
			}
			else
			{
				echo 'Error de conexión';
			}
		}

		public static function conectar()
		{
			if (!isset(self::$conexion))
			{
				self::$conexion = new Conexion;
			}
			
			return self::$conexion;
		}
	}


	$objeto = Conexion::conectar();
?>
