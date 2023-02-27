<?php
session_start();
include("../../assets/config/db.php");

$requestData = $_REQUEST;

$date1 = $requestData['date1'] == null ? date("Y-m-d") : $requestData['date1'];
$date2 = $requestData['date2'] == null ? date("Y-m-d") : $requestData['date2'];

$query = "SELECT m.productName, SUM(t.productAmount) AS totals FROM taborderdetail t 
                            JOIN mproduct m ON m.productID  = t.productID
                            JOIN taborderheader h ON t.orderID = h.orderID
                            WHERE h.orderDate BETWEEN '$date1' AND '$date2'
                         group by m.productID";
$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    $nestedData[no] = $x;
    $nestedData[productName] = $row["productName"];
    $nestedData[totals] = $row["totals"];
    
    $data[] = $nestedData;
}

$json_data = array(
        "draw" => intval($requestData['draw']),   // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw.
        "recordsTotal" => mysql_num_rows($res),  // total number of records
        "recordsFiltered" => mysql_num_rows($res), // total number of records after searching, if there is no searching then totalFiltered = totalData
        "data" => $data   // total data array
    );
    echo json_encode($json_data);

?>