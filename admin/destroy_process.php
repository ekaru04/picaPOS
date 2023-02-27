<?php  
	session_start();

	session_destroy();

	$URL="/picaPOS/admin/"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";

?>