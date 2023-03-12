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

$query = "SELECT r.requestID, r.requestDate, p.productName, o.outletName, r.remarks, r.status, c.categoryName, r.amount, m.measurementName, u.fullname,r.isPending FROM tabrequestheader r 
                INNER JOIN mcategory c ON r.categoryID = c.categoryID 
                INNER JOIN moutlet o ON r.outletID = o.outletID
                INNER JOIN mproduct p ON r.productID = p.productID
                INNER JOIN mmeasurement m ON r.measurementID = m.measurementID
                INNER JOIN muser u ON r.userID = u.userID WHERE r.outletID = '$outlet' ORDER BY r.lastChanged";
$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();

    $amount = $row['amount']." pcs";
    
    $nestedData[no] = $x;
    $nestedData[requestDate] = $row['requestDate'];
    $nestedData[productName] = $row['productName'];
    $nestedData[categoryName] = $row["categoryName"];
    $nestedData[outletName] = $row["outletName"];
    $nestedData[amount] = $amount;
    $nestedData[fullname] = $row["fullname"];
    $nestedData[measurementName] = $row["measurementName"];
    $nestedData[remarks] = $row["remarks"];
    
	
	switch($row["status"]){
		case 1:
			if($row["isPending"]==1){
				$nestedData[status] = "PENDING";
				$nestedData[action] = "<a href='approval_form.php?requestID=$row[requestID]'>WAITING APPROVAL</a>";
			}else{
				$nestedData[status] = "WAITING APPROVAL";
				$nestedData[action] = "<a href='approval_form.php?requestID=$row[requestID]'>WAITING APPROVAL</a>";
			}
			break;
		case 2:
			$nestedData[status] = "APPROVED";
            $nestedData[action] = "";
			break;
		case 69:
			$nestedData[status] = "REJECTED";
            $nestedData[action] = "";
			break;
	}
	
     
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