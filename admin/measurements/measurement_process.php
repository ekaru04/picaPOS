<?php
session_start();  
include("../../assets/config/db.php");

print_r($_POST['measurementID']);
$user      = $_SESSION["userID"];
if (isset($_POST['measurementID']))
{
	$measurementID = $_POST['measurementID'];
	$measurementName = strtoupper($_POST['measurementName']);
	$measurementCode = strtoupper($_POST['measurementCode']);
	$remarks = $_POST['remarks'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");


	$checkID = mysql_query("SELECT * FROM mmeasurement WHERE measurementID='$measurementID'");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==null){
		$query = "INSERT INTO mmeasurement(measurementID,measurementName,measurementCode,remarks,status,dateCreated,lastChanged) VALUES('$measurementID', '$measurementName', '$measurementCode', '$remarks', 1, '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
		$act = "INSERT_MEASUREMENT_".$measurementName;

		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_MEASUREMENT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}else{
		$query = "UPDATE mmeasurement SET
				measurementID='$measurementID',
				measurementName='$measurementName',
				measurementCode='$measurementCode',
				remarks='$remarks',
				lastChanged='$lastChanged'
				WHERE measurementID='$measurementID'
				";
				$res = mysql_query($query);
		$actUpd = "UPDATE_MEASUREMENT_".$measurementName;

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_MEASUREMENT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	$res = mysql_query($query);
	
}
	$URL="/picaPOS/admin/measurements"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>