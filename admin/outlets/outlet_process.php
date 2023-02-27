<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");

print_r($_POST['outletID']);
$user      = $_SESSION["userID"];
if (isset($_POST['outletID']))
{
	$outletID = $_POST['outletID'];
	$outletName = strtoupper($_POST['outletName']);
	$outletArea = strtoupper($_POST['outletArea']);
	$address = strtoupper($_POST['address']);
	$remarks = $_POST['remarks'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");


	$checkID = mysql_query("SELECT * FROM moutlet WHERE outletID='$outletID'");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==null){
		$query = "INSERT INTO moutlet(outletID,outletName,outletArea,address,remarks,status,dateCreated,lastChanged) VALUES('$outletID', '$outletName', '$outletArea', '$address', '$remarks', 1, '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);

		$act = "INSERT_OUTLET_".$outletName;

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_OUTLET','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}else{
		$query = "UPDATE moutlet SET
				outletID='$outletID',
				outletName='$outletName',
				outletArea='$outletArea',
				address='$address',
				remarks='$remarks',
				lastChanged='$lastChanged'
				WHERE outletID='$outletID'
				";
				$res = mysql_query($query);

		$actUpd = "UPDATE_OUTLET_".$outletName;

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_OUTLET','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	$res = mysql_query($query);
	
}
	$URL="/picaPOS/admin/outlets"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>