<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");

$requestData = $_REQUEST;

$query = "SELECT h.bundleID, h.bundleName, c.categoryName, o.outletName, h.bundlePeriode, h.bundlePrice, h.dateCreated, h.lastChanged, h.status FROM tabbundleheader h 
            INNER JOIN mcategory c ON h.categoryID = c.categoryID 
            INNER JOIN moutlet o ON h.outletID = o.outletID WHERE h.status != 0 ORDER BY h.lastChanged";
$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    $nestedData[no] = $x;
    $nestedData[bundleName] = $row["bundleName"];
    $nestedData[categoryName] = $row["categoryName"];
    $nestedData[outletName] = $row["outletName"];
    $nestedData[bundlePeriode] = $row["bundlePeriode"];
    $nestedData[bundlePrice] = $row["bundlePrice"];
    
	
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
    $nestedData[action] = "<a href='bundle_input.php?bundleID=$row[bundleID]'>EDIT</a>";
    
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