<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");

$requestData = $_REQUEST;

$today = date('Y-m-d');

$query = "SELECT * FROM systemjournal WHERE menu LIKE '%ORDER_COMPLETE%' AND dateCreated = '$today'";
$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    // $nestedData[no] = $x;
    $nestedData[journalID] = $row["journalID"];
    $nestedData[activity] = $row["activity"];
    $nestedData[menu] = $row["menu"];
    $nestedData[userID] = $row["userID"];
    $nestedData[logCreated] = $row["logCreated"];
	
	switch($row["status"]){
		case 'SUCCESS':
			$nestedData[status] = "<p class='text-success'><b>SUCCESS</b></p>";
			break;
		case 'FAILED':
			$nestedData[status] = "<p class='text-danger'><b>FAILED</b></p>";
			break;
	}
	
    // $nestedData[lastChanged] = $row["lastChanged"];
    // $nestedData[action] = "<a href='outlet_input.php?outletID=$row[outletID]'>EDIT</a>";
    
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