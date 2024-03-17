<?php
//   	$server = '192.168.1.2'; 
	$server = '192.168.1.16'; 
   	$dbSQL = mssql_connect($server, 'sa', 'sps');
 
   	if (!$dbSQL) { die('Something went wrong while connecting to MSSQL'); }
   	else { mssql_select_db('PRATTS'); }
?>