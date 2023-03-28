<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");

$requestData = $_REQUEST;

$orderID = $_GET['orderID'];

$query = "SELECT h.orderID, p.productName, d.productAmount, d.productSubtotal, h.lastChanged FROM taborderdetail d
INNER JOIN tabpaymentorder o ON d.orderID = o.orderID
INNER JOIN mproduct p ON d.productID = p.productID
INNER JOIN taborderheader h ON h.orderID = d.orderID
WHERE h.orderID = '$orderID'";

$res = mysql_query($query);

$guest = mysql_query("SELECT * FROM tabusermenu WHERE userID = '$_SESSION[userID]'");
$rowGuest = mysql_fetch_array($guest);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    $nestedData[no] = $x;
    $nestedData[orderID] = $row['orderID'];
    $nestedData[productName] = $row["productName"];
    $nestedData[productAmount] = $row["productAmount"];
if($rowGuest['menuID']=='GST1'):
    $nestedData[productSubtotal] = $row["productSubtotal"]/2;
else:
    $nestedData[productSubtotal] = $row["productSubtotal"];
endif;
    $nestedData[lastChanged] = $row["lastChanged"];
    
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