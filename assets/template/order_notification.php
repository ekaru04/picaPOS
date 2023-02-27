<?php
include("../../assets/config/db.php");
session_start();

    $outletID = $_SESSION['outletID'];
    $query = "SELECT count(orderID) counts FROM taborderheader where outletID = '$outletID' AND status = 0 ORDER BY orderID";
    $res = mysql_query($query);
    $row = mysql_fetch_array($res);
    
	$data = array();
	$data[countOrder] = $row[counts];

	echo json_encode($data);
?>