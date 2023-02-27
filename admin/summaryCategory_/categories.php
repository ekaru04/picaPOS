<?php
session_start();
include("../../assets/config/db.php");

$requestData = $_REQUEST;

$dateA = $requestData['dateA'] == null ? date("Y-m-d") : $requestData['dateA'];
$dateB = $requestData['dateB'] == null ? date("Y-m-d") : $requestData['dateB'];

$query = "SELECT c.categoryName, SUM(t.productAmount) AS totals 
            FROM taborderdetail t 
                JOIN mproduct m ON m.productID  = t.productID 
                JOIN mcategory c ON m.categoryID = c.categoryID
                JOIN taborderheader h ON t.orderID = h.orderID
                WHERE h.orderDate BETWEEN '$dateA' AND '$dateB'
            GROUP BY c.categoryID";
$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    $nestedData[no] = $x;
    $nestedData[categoryName] = $row["categoryName"];
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