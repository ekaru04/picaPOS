<?php
session_start();
include("../../assets/config/db.php");

$requestData = $_REQUEST;
$query = mysql_query("SELECT * FROM muser WHERE userID = '$_SESSION[userID]'");
$data = mysql_fetch_array($query);

$outlet = $data['outletID'];


$query = "SELECT ingredientID,ingredient,ROUND(curStock) as curStock,ROUND(minStock) as minStock,o.outletName,measurementName,i.remarks,i.status,i.lastChanged FROM mingredient i 
    INNER JOIN mmeasurement m ON i.measurementID = m.measurementID
    INNER JOIN moutlet o ON i.outletID = o.outletID
            where i.status != 0 AND i.outletID = '$outlet'
            order by i.ingredientID";
$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    $nestedData[no] = $x;
    $nestedData[ingredient] = "<a href='ingredient_history.php?ingredientID=$row[ingredientID]'>$row[ingredient]</a>";
    $nestedData[curStock] = $row["curStock"];
    $nestedData[minStock] = $row["minStock"];
    $nestedData[outletName] = $row["outletName"];
    $nestedData[measurementName] = $row["measurementName"];
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