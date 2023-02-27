<?php
include('../../assets/config/db.php'); 
header('Content-Type: application/json; charset=utf8');
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}

$requestData = $_REQUEST;

$date = date('Y-m-d');

$queryData = mysql_query("SELECT m.productName, SUM(t.productAmount) AS jumlah_pembelian FROM taborderdetail t 
                            JOIN mproduct m ON m.productID  = t.productID
                            JOIN taborderheader h ON t.orderID = h.orderID
                            -- WHERE h.orderDate = '$date'
                         group by m.productID");
$array = array();
	while ($data=mysql_fetch_assoc($queryData)) {
		$array[]=$data;
	}
echo json_encode($array);
?>