<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");

$requestData = $_REQUEST;

$query = "SELECT u.userID,u.employeeNo, u.username, u.password, o.outletName, d.departmentName, p.positionName, u.status, u.lastChanged, u.fullname 
            FROM muser u
            INNER JOIN mdepartment d ON u.departmentCode = d.departmentCode
            INNER JOIN mposition p ON u.positionID = p.positionID 
            INNER JOIN moutlet o ON u.outletID = o.outletID
			
		ORDER BY u.dateCreated ASC";
$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    $nestedData[no] = $x;
    $nestedData[employeeNo] = $row["employeeNo"];
    $nestedData[username] = $row["username"];
    // $nestedData[password] = $row["password"];
    $nestedData[fullname] = $row["fullname"];
    $nestedData[outletName] = $row["outletName"];
    $nestedData[departmentName] = $row["departmentName"];
    $nestedData[positionName] = $row["positionName"];
	
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
    $nestedData[action] = "<a href='user_input.php?userID=$row[userID]'>EDIT</a>";
    
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