<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");
date_default_timezone_set('Asia/Jakarta');
$date = date("ymd");
// print_r($_POST['supplierID']);
$user      = $_SESSION["userID"];
if (isset($_POST['supplierID']))
{
	$supplierID = $_POST['supplierID'];
	$supplierName = strtoupper($_POST['supplierName']);
	$address = strtoupper($_POST['address']);
	$phoneNum = $_POST['phoneNum'];
	$pic = $_POST['pic'];
	$remarks = $_POST['remarks'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");


	$checkID = mysql_query("SELECT * FROM msupplier WHERE supplierID='$supplierID'");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==0){
		$suppUCode = "SPL-".$date.-$supplierID;
		$query = "INSERT INTO msupplier(supplierID,supplierName,address,phoneNum,pic,remarks,status,dateCreated,lastChanged) VALUES('$suppUCode', '$supplierName', '$address', '$phoneNum', '$pic', '$remarks', 1, '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);

		$act = "INSERT_SUPPLIER_".$supplierName;

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_SUPPLIER','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}else{
		$query = "UPDATE msupplier SET
				supplierID='$supplierID',
				supplierName='$supplierName',
				address='$address',
				phoneNum='$phoneNum',
				pic='$pic',
				remarks='$remarks',
				lastChanged='$lastChanged'
				WHERE supplierID='$supplierID'
				";
				$res = mysql_query($query);

		$actUpd = "UPDATE_SUPPLIER_".$supplierName;

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_SUPPLIER','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	// $res = mysql_query($query);
	
}
	$URL="/picaPOS/admin/suppliers"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>