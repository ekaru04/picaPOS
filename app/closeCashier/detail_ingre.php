<?php
session_start();
include("../../assets/config/db.php");

$date = $_GET[transDate];
// $date2 = $_GET[date2];

$query = "SELECT SUM(afterDiscount) AS total FROM tabitemtransaction WHERE transDate = '$date'";
$res = mysql_query($query);

$x=0;
$dataIngre = array();
$row=mysql_fetch_array($res);


$dataIngre[total] = $row['total'];


echo json_encode($dataIngre);
?>