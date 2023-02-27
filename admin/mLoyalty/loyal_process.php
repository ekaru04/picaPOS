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
// print_r($_POST['loyalID']);
$user      = $_SESSION["userID"];
if (isset($_POST['loyalID']))
{
	$loyalID = $_POST['loyalID'];
	$requirement = $_POST['requirement'];
	$point = $_POST['point'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");


	$checkID = mysql_query("SELECT * FROM mloyalty WHERE loyalID='$loyalID'");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==0){
		$suppUCode = "LYL-".$date.-$loyalID;
		$query = "INSERT INTO mloyalty(loyalID,requirement,point,status,dateCreated,lastChanged) VALUES('$suppUCode', '$requirement', '$point', 1, '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);

		$act = "INSERT_LOYALTY_".$suppUCode;

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_LOYALTY','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}else{
		$query = mysql_query("UPDATE mloyalty SET requirement = '$requirement', point = '$point', lastChanged = '$lastChanged' WHERE loyalID='$loyalID'");

		$actUpd = "UPDATE_LOYALTY_".$suppUCode;

		$journalID = date("YmdHis");
		$queryJournal = mysql_query("INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_LOYALTY','$user','$dateCreated','$lastChanged', 'SUCCESS')");

		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	// $res = mysql_query($query);
	
}
	$URL="/picaPOS/admin/suppliers"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>