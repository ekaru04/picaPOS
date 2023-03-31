<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");

$requestData = $_REQUEST;

// $query = "SELECT d.id, h.priceID, h.priceName, p.productName, d.price, h.description, h.lastChanged FROM tabpriceheader h
//             INNER JOIN tabpricedetail d ON h.priceID = d.priceID
//             INNER JOIN mproduct p ON d.productID = p.productID
//             WHERE h.status != 0";
$query = "SELECT d.id, h.priceID, h.priceName, p.productName, d.price, h.description, h.lastChanged FROM tabpricedetail d 
                INNER JOIN tabpriceheader h ON d.priceID = h.priceID
                INNER JOIN mproduct p ON d.productID = p.productID
                WHERE d.status != 0";
$res = mysql_query($query);

$guest = mysql_query("SELECT * FROM tabusermenu WHERE userID = '$_SESSION[userID]'");
$rowGuest = mysql_fetch_array($guest);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    $nestedData[no] = $x;
    $nestedData[priceName] = $row["priceName"];
    $nestedData[productName] = $row["productName"];
if($rowGuest['menuID']=='GST1'):
    $nestedData[price] = $row["price"]/2;
else:
    $nestedData[price] = $row["price"];
endif;
    $nestedData[description] = $row["description"];
    $nestedData[lastChanged] = $row["lastChanged"];
    $nestedData[action] = "<a href='price_input.php?id=$row[id]'>EDIT</a>";
    
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