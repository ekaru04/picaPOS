<?php
include('../../assets/config/db.php'); 
header('Content-Type: application/json; charset=utf8');
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}

$queryData = mysql_query("SELECT c.categoryName, SUM(t.productAmount) AS jumlah_pembelian 
FROM taborderdetail t 
JOIN mproduct m ON m.productID  = t.productID 
JOIN mcategory c ON m.categoryID = c.categoryID
group by c.categoryID");
$array = array();
	while ($data=mysql_fetch_assoc($queryData)) {
		$array[]=$data;
	}
echo json_encode($array);
?>