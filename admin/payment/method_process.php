<?php
session_start();  
include("../../assets/config/db.php");

// print_r($_POST['methodID']);
$user      = $_SESSION["userID"];
if (isset($_POST['methodID']))
{
	$methodID = $_POST['methodID'];
	$methodName = strtoupper($_POST['methodName']);
	$methodType = strtoupper($_POST['methodType']);
	$remarks = $_POST['remarks'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");


	$checkID = mysql_query("SELECT * FROM mpaymentmethod WHERE methodID='$methodID'");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==null){
		$query = "INSERT INTO mpaymentmethod(methodID,methodName,methodType,remarks,status,dateCreated,lastChanged) VALUES('$methodID', '$methodName', '$methodType', '$remarks', 1, '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
					$act = "INSERT_PAYMENT_".$methodName;

					$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_PAYMENT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
					$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}else{
		$query = "UPDATE mpaymentmethod SET
				methodID='$methodID',
				methodName='$methodName',
				methodType='$methodType',
				remarks='$remarks',
				lastChanged='$lastChanged'
				WHERE methodID='$methodID'
				";
				$res = mysql_query($query);

				$journalID = date("YmdHis");
		$actUpd = "UPDATE_PAYMENT_".$methodName;

		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_PAYMENT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	$res = mysql_query($query);
	
}
	$URL="/picaPOS/admin/payment"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>