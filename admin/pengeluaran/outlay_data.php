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

$query = "SELECT t.id, s.stockName, t.amount, t.price, t.pic, o.outletName, t.lastChanged, t.photoName 
            FROM tabstocktransaction t 
            INNER JOIN mstock s ON t.stockID = s.stockID 
            INNER JOIN moutlet o ON t.outletID = o.outletID
            WHERE t.type = 'IN' ORDER BY t.dateCreated ASC";
$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    $nestedData[no] = $x;
    $nestedData[stockName] = "<a href='../itemTrans/index.php?id=$row[id]'>$row[stockName]</a>";
    $nestedData[amount] = $row["amount"];
    $nestedData[price] = $row["price"];
    $nestedData[pic] = $row["pic"];
    $nestedData[outletName] = $row["outletName"];
    $nestedData[lastChanged] = $row["lastChanged"];
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