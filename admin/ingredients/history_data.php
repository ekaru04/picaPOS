<?php
session_start();
include("../../assets/config/db.php");

$requestData = $_REQUEST;

$ingredient = $_GET['ingredientID'];
// echo $ingredient;

$query = "SELECT h.transType, i.ingredient, h.amount, h.itemAmount, m.measurementName, h.cost, u.fullname, h.status, h.lastChanged FROM tabitemhistory h
            INNER JOIN mingredient i ON h.ingredientID = i.ingredientID
            INNER JOIN mmeasurement m ON h.measurementID = m.measurementID
            INNER JOIN muser u ON h.userID = u.userID
            WHERE h.ingredientID='$ingredient'
            ORDER BY h.lastChanged DESC";
$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    $amount = number_format($row["amount"]);
    $itemAmount = number_format($row["itemAmount"]);
    $cost = "Rp. ".number_format($row["cost"]).",-";

    $nestedData[no] = $x;
    $nestedData[transType] = $row['transType'];
    $nestedData[ingredient] = $row["ingredient"];
    $nestedData[amount] = $amount;
    $nestedData[itemAmount] = $itemAmount;
    $nestedData[measurementName] = $row["measurementName"];
    $nestedData[cost] = $cost;
    $nestedData[fullname] = $row["fullname"];
	
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
    $nestedData[action] = "<a href='ingredient_input.php?ingredientID=$row[ingredientID]'>EDIT</a>";
    
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