<?php
session_start();  
include("../../assets/config/db.php");

print_r($_POST['voucherCode']);
$user      = $_SESSION["userID"];
if (isset($_POST['voucherCode']))
{
	$voucherCode = $_POST['voucherCode'];
	$voucherName = strtoupper($_POST['voucherName']);
	$voucherType = strtoupper($_POST['voucherType']);
	$voucherRequirement = strtoupper($_POST['voucherRequirement']);
	$voucherSaldo = $_POST['voucherSaldo'];
	$expDate = $_POST['expDate'];
	$description = $_POST['description'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");


    /* 
		------->Start Generate Voucher Code MD5<-------
    */
    $md5Code = strtoupper(uniqid($_POST['voucherCode']));
    $outputCode = str_split($md5Code,5);
    $code = implode($outputCode, "-");
    //echo $code;
    /* 
		--------------------->END<---------------------
    */

	$checkID = mysql_query("SELECT * FROM mvoucher WHERE voucherCode='$voucherCode'");
	$row = mysql_num_rows($checkID);

	// echo $row;
	// $rowCheck = mysql_fetch_array($checkID);

	if($row==0){
		$query = "INSERT INTO mvoucher(voucherCode,voucherName,voucherType,voucherRequirement,voucherSaldo,expDate,description,status,dateCreated,lastChanged) VALUES('$code', '$voucherName', '$voucherType', '$voucherRequirement', '$voucherSaldo','$expDate', '$description', 1, '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
		$act = "INSERT_VOUCHER_".$voucherName;

		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_VOUCHER','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}else{

		$query = "UPDATE mvoucher SET
				voucherCode='$voucherCode',
				voucherName='$voucherName',
				voucherType='$voucherType',
				voucherRequirement='$voucherRequirement',
				voucherSaldo='$voucherSaldo',
				expDate='$expDate',
				description='$description',
				lastChanged='$lastChanged'
				WHERE voucherCode='$voucherCode'
				";
				$res = mysql_query($query);

		$journalID = date("YmdHis");
		$actUpd = "UPDATE_VOUCHER_".$voucherName;

		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_POSITION','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	$res = mysql_query($query);
	
}
	$URL="/picaPOS/admin/activeVouchers"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>