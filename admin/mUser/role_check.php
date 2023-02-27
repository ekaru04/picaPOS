<?php
	
include("../../assets/config/db.php");

$data = array();
$res = mysql_query("SELECT * FROM tabUserMenu WHERE userID = '$_GET[userID]' order by menuID");
while($row=mysql_fetch_array($res)){
	switch($rowItem['menuID']){
		case "A001":
			$data[ops1] = 1;
			break;
		case "A002":
			$data[ops2] = 1;
			break;
		case "A003":
			$data[ops3] = 1;
			break;
		case "B001":
			$data[trx1] = 1;
			break;
		case "B002":
			$data[trx2] = 1;
			break;
		case "B003":
			$data[trx3] = 1;
			break;
		case "C001":
			$data[mas1] = 1;
			break;
		case "C002":
			$data[mas2] = 1;
			break;
		case "C003":
			$data[mas3] = 1;
			break;
		case "C004":
			$data[mas4] = 1;
			break;
		case "C005":
			$data[mas5] = 1;
			break;
		case "C006":
			$data[mas6] = 1;
			break;
		case "D001":
			$data[stk1] = 1;
			break;
		case "D002":
			$data[stk2] = 1;
			break;
		case "D003":
			$data[stk3] = 1;
			break;
		case "E001":
			$data[rpt1] = 1;
			break;
		case "E002":
			$data[rpt2] = 1;
			break;
		case "E003":
			$data[rpt3] = 1;
			break;
		case "F001":
			$data[mgt1] = 1;
			break;
		case "F002":
			$data[mgt2] = 1;
			break;
		case "F003":
			$data[mgt3] = 1;
			break;
		case "F004":
			$data[mgt4] = 1;
			break;
		case "GST1":
			$data[gst1] = 1;
			break;
	}
}
echo json_encode($data);
?>