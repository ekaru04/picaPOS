<?php
session_start();
include("../../assets/config/db.php");

$queryPrice = mysql_query("SELECT p.productID, p.productName, d.price FROM mproduct p
INNER JOIN tabpricedetail d ON p.productID = d.productID AND d.priceID = '$_GET[priceID]'
WHERE p.productID = '$_GET[productID]' AND p.outletID = '$_SESSION[outletID]' AND p.status = 1 AND p.curStock != 0");

$data = array();
$row=mysql_fetch_array($queryPrice);
$data[productName] = $row['productName'];
$data[price] = $row['price'];
	
    echo json_encode($data);
?>