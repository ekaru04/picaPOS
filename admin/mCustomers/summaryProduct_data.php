<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");

$requestData = $_REQUEST;
$id = $_GET['customerID'];

$queryD = mysql_query("SELECT h.payerName, p.productName, SUM( d.productAmount ) AS total, h.orderDate FROM taborderheader h
        INNER JOIN mcustomer c ON h.payerName = c.customerName
        INNER JOIN taborderdetail d ON h.orderID = d.orderID
        INNER JOIN mproduct p ON p.productID = d.productID
    WHERE c.customerID = '$id' AND h.orderDate BETWEEN '$_REQUEST[date1]' AND '$_REQUEST[date2]' GROUP BY p.productName");

$x=0;
$data = array();
while ($row=mysql_fetch_array($queryD)){
    $x+=1;
    $nestedData = array();
    
    $nestedData[no] = $x;
    $nestedData[productName] = $row["productName"];
    $nestedData[total] = $row["total"];
    $nestedData[orderDate] = $row["orderDate"];
    
    $data[] = $nestedData;
}

$json_data = array(
        "draw" => intval($requestData['draw']),   // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw.
        "recordsTotal" => mysql_num_rows($queryD),  // total number of records
        "recordsFiltered" => mysql_num_rows($queryD), // total number of records after searching, if there is no searching then totalFiltered = totalData
        "data" => $data   // total data array
    );
    echo json_encode($json_data);

?>