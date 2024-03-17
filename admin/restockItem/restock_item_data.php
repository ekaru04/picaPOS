<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");
/* Set Timezone to Jakarta Timezone */
date_default_timezone_set('Asia/Jakarta');
$requestData = $_REQUEST;

$query = mysql_query("SELECT * FROM muser WHERE userID = '$_SESSION[userID]'");
$data = mysql_fetch_array($query);

$outlet = $data['outletID'];

/*

------>Set Status Jika expDate melebihi pertanggal hari ini<------

*/
$dateNow = date("Y-m-d");
$queryDate = "SELECT * FROM mvoucher where status != 0";
$resDate = mysql_query($queryDate);
while($rowDate=mysql_fetch_array($resDate)){
    if($dateNow >= $rowDate["expDate"]){
        $queryD = "UPDATE mvoucher SET status=0";
        $resD=mysql_query($queryD);
    }
}
/*

------>END PROCESS SET STATUS<------

*/


$query = "SELECT a.transItemDate, s.supplierName, e.measurementName, m.outletName, sm.stockName, a.amountBuy, a.totalPrice, a.discountPrice, a.afterDiscount, u.fullname FROM tabstocktransaction a 
            INNER JOIN msupplier s ON a.supplierID = s.supplierID
            INNER JOIN moutlet m ON a.outletID = m.outletID
            INNER JOIN mstock sm ON a.stockID = sm.stockID
            INNER JOIN muser u ON a.userID = u.userID
            INNER JOIN mmeasurement e ON a.measurementID = e.measurementID
            WHERE a.outletID = '$outlet'";
$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    // $disc = $row["discountPrice"] * 100;
    $x+=1;
    $nestedData = array();

    $totalPrice = "Rp. ".number_format($row["totalPrice"]).",-";
    $discountPrice = "Rp. ".number_format($row["discountPrice"]).",-";
    $afterDiscount = "Rp. ".number_format($row["afterDiscount"]).",-";

    
    $nestedData[no] = $x;
    $nestedData[transItemDate] = $row["transItemDate"];
    $nestedData[supplierName] = $row["supplierName"];
    $nestedData[stockName] = $row["stockName"];
    $nestedData[amountBuy] = $row["amountBuy"];
    $nestedData[measurementName] = $row["measurementName"];
    $nestedData[totalPrice] = $totalPrice;
    $nestedData[discountPrice] = $discountPrice;
    $nestedData[afterDiscount] = $afterDiscount;
    $nestedData[fullname] = $row["fullname"];
	
    // $nestedData[lastChanged] = $row["lastChanged"];
    // $nestedData[action] = "<a href=#>EDIT</a>";
    
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