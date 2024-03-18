<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");

$requestData = $_REQUEST;

// print_r($_REQUEST[date1]);
// exit;

$query = mysql_query("SELECT * FROM muser WHERE userID = '$_SESSION[userID]'");
$data = mysql_fetch_array($query);

$query = "SELECT it.transDate, i.ingredient, m.measurementName, it.amount, it.itemAmount, 
                it.totalPrice, it.discountPrice, it.afterDiscount, u.fullname, it.dateCreated 
            FROM tabitemtransaction it 
            INNER JOIN mingredient i ON i.ingredientID = it.ingredientID
            INNER JOIN mmeasurement m ON m.measurementID = it.measurementID
            INNER JOIN muser u ON u.userID = it.userID
            WHERE it.transDate BETWEEN '$_REQUEST[date1]' AND '$_REQUEST[date2]'";
$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    $totalPrice = number_format($row["totalPrice"]);
    $discountPrice = number_format($row["discountPrice"]);
    $afterDiscount = number_format($row["afterDiscount"]);
    
    $nestedData[no] = $x;
    $nestedData[transDate] = $row["transDate"];
    $nestedData[ingredient] = $row["ingredient"];
    $nestedData[measurementName] = $row["measurementName"];
    $nestedData[amount] = $row["amount"];
    $nestedData[itemAmount] = $row["itemAmount"];
    $nestedData[totalPrice] = "Rp. ".$totalPrice;
    $nestedData[discountPrice] = "Rp. ".$discountPrice;
    $nestedData[afterDiscount] = "Rp. ".$afterDiscount;
    $nestedData[fullname] = $row["fullname"];
    $nestedData[dateCreated] = $row["dateCreated"];
    // $nestedData[action] = "<a href='promo_input.php?promoID=$row[promoID]'>EDIT</a>";
    
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