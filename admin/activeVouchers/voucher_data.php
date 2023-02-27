<?php
session_start();
include("../../assets/config/db.php");
/* Set Timezone to Jakarta Timezone */
date_default_timezone_set('Asia/Jakarta');
$requestData = $_REQUEST;

/*

------>Set Status Jika expDate melebihi pertanggal hari ini<------

*/
$dateNow = date("Y-m-d");
$queryDate = "SELECT * FROM mvoucher where status != 0";
$resDate = mysql_query($queryDate);
while($rowDate=mysql_fetch_array($resDate)){
    if($dateNow >= $rowDate["expDate"]){
        $queryD = "UPDATE mvoucher SET status=0";
        $resD=mysql_query($queryD);
    }
}
/*

------>END PROCESS SET STATUS<------

*/


$query = "SELECT * FROM mvoucher where status != 0";
$res = mysql_query($query);

$x=0;
$data = array();
while ($row=mysql_fetch_array($res)){
    $x+=1;
    $nestedData = array();

    $voucherSaldo = "Rp. ".number_format($row["voucherSaldo"]).",-";
    
    $nestedData[no] = $x;
    $nestedData[voucherCode] = $row["voucherCode"];
    $nestedData[voucherName] = $row["voucherName"];
    $nestedData[voucherType] = $row["voucherType"];
    $nestedData[voucherSaldo] = $voucherSaldo;
    $nestedData[expDate] = $row["expDate"];
    $nestedData[description] = $row["description"];
	
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
    $nestedData[action] = "<a href='voucher_input.php?voucherCode=$row[voucherCode]'>EDIT</a>";
    
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