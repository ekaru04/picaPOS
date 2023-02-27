<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");

$requestData = $_REQUEST;
$stat = "";
switch($_REQUEST[status]){
	case 0:
		$stat = " AND h.status !=0";
		break;
	case 1:
		$stat = " AND h.status =1";
		break;
	case 9:
		$stat = "AND h.status =9";
		break;
}

$query = "SELECT h.preorderID, h.preorderNo, h.preorderDate, h.preorderPeriode, h.preorderAmount, o.outletName, p.total, u.fullname, h.remarks, h.status, h.lastChanged FROM tabpreorderheader h
INNER JOIN moutlet o ON h.outletID = o.outletID
INNER JOIN tabpaymentorder p ON h.preorderID = p.orderID
INNER JOIN muser u ON h.userID = u.userID
WHERE (h.preorderDate BETWEEN '$_REQUEST[date1]' AND '$_REQUEST[date2]') $stat ORDER BY h.dateCreated ASC";

$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    $nestedData[no] = $x;
    $nestedData[preorderID] = $row['preorderID'];
    $nestedData[preorderNo] = $row["preorderNo"];
    $nestedData[preorderDate] = $row["preorderDate"];
    // $nestedData[orderPeriode] = $row["orderPeriode"];
    $nestedData[preorderAmount] = $row["preorderAmount"];
    $nestedData[outletName] = $row["outletName"];
    $nestedData[total] = $row["total"];
    $nestedData[fullname] = $row["fullname"];
    $nestedData[remarks] = $row["remarks"];
	
	switch($row["status"]){
		case 0:
			$nestedData[status] = "NONACTIVE";
			break;
		case 1:
			$nestedData[status] = "<p class='text-success'><b>TRANSACTION SUCCESS</b></p>";
			break;
		case 9:
			$nestedData[status] = "<p class='text-danger'><b>TRANSACTION CANCELED</b></p>";
			break;
	}
	
    $nestedData[lastChanged] = $row["lastChanged"];
    $nestedData[detail] = "<a href='transaction_view.php?orderID=$row[orderID]'>VIEW DETAIL</a>";
    
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