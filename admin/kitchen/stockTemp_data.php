<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");

$requestData = $_REQUEST;

$query = mysql_query("SELECT * FROM muser WHERE userID = '$_SESSION[userID]'");
$data = mysql_fetch_array($query);

$outlet = $data['outletID'];

$query = "SELECT t.tempID, t.requestID, p.productName, t.newStock, o.outletName, t.dateCreated FROM tabproductstocktemp t 
        INNER JOIN mproduct p ON p.productID = t.productID 
        INNER JOIN moutlet o ON o.outletID = t.outletID 
        WHERE t.outletID = '$outlet'";
$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    $nestedData[no] = $x;
    $nestedData[tempID] = $row["tempID"];
    $nestedData[requestID] = $row["requestID"];
    $nestedData[productName] = $row["productName"];
    $nestedData[newStock] = $row["newStock"];
    $nestedData[outletName] = $row["outletName"];
    $nestedData[dateCreated] = $row["dateCreated"];

    if($row['newStock'])
    
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