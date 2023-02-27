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

$query = "SELECT p.promoName,p.promoType,p.promoRequirement,p.promoID,o.outletName,p.remarks,p.status,p.lastChanged,p.dateCreated FROM mpromo p INNER JOIN moutlet o ON p.outletID = o.outletID where p.status != 0 AND p.outletID = '$outlet' ORDER BY p.dateCreated DESC";
$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    $nestedData[no] = $x;
    $nestedData[promoName] = $row["promoName"];
    $nestedData[promoType] = $row["promoType"];
    $nestedData[promoRequirement] = $row["promoRequirement"];
    $nestedData[outletName] = $row["outletName"];
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
    $nestedData[action] = "<a href='promo_input.php?promoID=$row[promoID]'>EDIT</a>";
    
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