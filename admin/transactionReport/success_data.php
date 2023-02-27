<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");

$requestData = $_REQUEST;

$query = "SELECT h.orderID, h.orderNo, h.orderDate, h.orderPeriode, h.orderAmount, o.outletName, h.total, u.fullname, h.remarks, h.status, h.lastChanged FROM taborderheader h
INNER JOIN moutlet o ON h.outletID = o.outletID
INNER JOIN muser u ON h.userID = u.userID
WHERE h.status = 1 ORDER BY h.dateCreated ASC";
$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    $nestedData[no] = $x;
    $nestedData[orderID] = $row['orderID'];
    $nestedData[orderNo] = $row["orderNo"];
    $nestedData[orderDate] = $row["orderDate"];
    $nestedData[orderPeriode] = $row["orderPeriode"];
    $nestedData[orderAmount] = $row["orderAmount"];
    $nestedData[outletName] = $row["outletName"];
    $nestedData[total] = $row["total"];
    $nestedData[fullname] = $row["fullname"];
    $nestedData[remarks] = $row["remarks"];
	
	switch($row["status"]){
		case 0:
			$nestedData[status] = "NONACTIVE";
			break;
		case 1:
			$nestedData[status] = "TRANSACTION SUCCESS";
			break;
		case 9:
			$nestedData[status] = "TRANSACTION CANCELED";
			break;
	}
	
    $nestedData[lastChanged] = $row["lastChanged"];
    // $nestedData[action] = "<a href='transaction_view.php?supplierID=$row[supplierID]'>VIEW DETAIL</a>";
    
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