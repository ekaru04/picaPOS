<?php
session_start();
include("../../assets/config/db.php");

$requestData = $_REQUEST;
$query = mysql_query("SELECT * FROM muser WHERE userID = '$_SESSION[userID]'");
$data = mysql_fetch_array($query);

$outlet = $data['outletID'];


$query = "SELECT s.stockID, s.stockName, c.categoryStockName, m.measurementName, s.curStock, s.minStock, o.outletName, s.remarks, s.lastChanged FROM mstock s INNER JOIN mstockcategory c ON s.categoryStockID = c.categoryStockID INNER JOIN mmeasurement m ON s.measurementID = m.measurementID INNER JOIN moutlet o ON s.outletID = o.outletID WHERE s.status != 0 ORDER BY s.lastChanged DESC";
$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    $nestedData[no] = $x;
    $nestedData[stockName] = $row["stockName"];
    $nestedData[categoryStockName] = $row["categoryStockName"];
    $nestedData[measurementName] = $row["measurementName"];
    $nestedData[curStock] = $row["curStock"];
    $nestedData[minStock] = $row["minStock"];
    $nestedData[outletName] = $row["outletName"];
    $nestedData[remarks] = $row["remarks"];
	
	// switch($row["status"]){
	// 	case 0:
	// 		$nestedData[status] = "NONACTIVE";
	// 		break;
	// 	case 1:
	// 		$nestedData[status] = "ACTIVE";
	// 		break;
	// 	case 99:
	// 		$nestedData[status] = "QUARANTINED";
	// 		break;
	// }
	
    $nestedData[lastChanged] = $row["lastChanged"];
    $nestedData[action] = "<a href='stock_input.php?stockID=$row[stockID]'>EDIT</a>";
    
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