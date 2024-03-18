<?php
session_start();
include("../../assets/config/db.php");

$date1 = $_GET[date1];
$date2 = $_GET[date2];

$query = "SELECT SUM(afterDiscount) AS total FROM tabstocktransaction WHERE transItemDate BETWEEN '$date1' AND '$date2'";
$res = mysql_query($query);

$x=0;
$data = array();
$row=mysql_fetch_array($res);


$data[total] = $row['total'];


echo json_encode($data);
?>