<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");

$requestData = $_REQUEST;

$query = "SELECT c.customerID, c.customerName, c.customerPhone, c.customerEmail, l.loyaltyPoint, c.status, c.lastChanged FROM mcustomer c
            INNER JOIN tabloyalty l ON c.customerID = l.customerID
            WHERE c.status != 0 ORDER BY c.dateCreated ASC";
$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    $nestedData[no] = $x;
    $nestedData[customerName] = "<a href='summaryProduct.php?customerID=$row[customerID]'>$row[customerName]</a>";
    $nestedData[customerPhone] = $row["customerPhone"];
    $nestedData[customerEmail] = $row["customerEmail"];
    $nestedData[loyaltyPoint] = $row["loyaltyPoint"];
	
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
    $nestedData[action] = "<a href='customer_input.php?customerID=$row[customerID]'>EDIT</a>";
    
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