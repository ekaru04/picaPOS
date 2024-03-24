<?php
session_start();
include("../../assets/config/db.php");

$date = $_GET[transItemDate];
// $date2 = $_GET[date2];

$query = "SELECT SUM(afterDiscount) AS total FROM tabstocktransaction WHERE transItemDate = '$date'";
$res = mysql_query($query);

$x=0;
$dataStock = array();
$row=mysql_fetch_array($res);


$dataStock[total] = $row['total'];


echo json_encode($dataStock);
?>