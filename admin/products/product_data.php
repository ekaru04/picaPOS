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

$query = "SELECT p.productID, p.productName, c.categoryName, ROUND(p.curStock) as curStock, o.outletName, m.measurementName, ROUND(p.productPrice) as productPrice, p.remarks, p.status, p.lastChanged FROM mproduct p
INNER JOIN mcategory c ON c.categoryID = p.categoryID
INNER JOIN mmeasurement m ON m.measurementID = p.measurementID 
INNER JOIN moutlet o ON p.outletID = o.outletID
WHERE p.status != 0 AND p.outletID = '$outlet'";
$res = mysql_query($query);

$guest = mysql_query("SELECT * FROM tabusermenu WHERE userID = '$_SESSION[userID]'");
$rowGuest = mysql_fetch_array($guest);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();

    $priceGuest = $row["productPrice"]/2;

    $productPrice = "Rp. ".number_format($priceGuest).",-";

    
    $nestedData[no] = $x;
    $nestedData[productName] = "<a href='product_history.php?productID=$row[productID]'>$row[productName]</a>";
    $nestedData[categoryName] = $row["categoryName"];
    $nestedData[curStock] = $row["curStock"];
    $nestedData[outletName] = $row["outletName"];
    $nestedData[measurementName] = $row["measurementName"];
if($rowGuest['menuID']=='GST1'):
    $nestedData[productPrice] = $priceGuest/2;
else:
    $nestedData[productPrice] = $priceGuest;
endif;
    $nestedData[remarks] = $row["remarks"];
    
    
    switch($row["status"]){
        case 0:
            $nestedData[status] = "NONACTIVE";
            break;
        case 1:
            $nestedData[status] = "ACTIVE";
            break;
        case 99:
            $nestedData[status] = "QUARANTINED";
            break;
    }
    
    $nestedData[lastChanged] = $row["lastChanged"];
    $nestedData[action] = "<a href='product_input.php?productID=$row[productID]'>EDIT</a>";
    
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