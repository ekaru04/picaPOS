<?php
session_start();  
include("../../assets/config/db.php");

// print_r($_POST['categoryID']);
$user      = $_SESSION["userID"];
if (isset($_POST['customerID']))
{
	$customerID = $_POST['customerID'];
	$customerName = strtoupper($_POST['customerName']);
	$customerPhone = strtoupper($_POST['customerPhone']);
	$customerEmail = strtoupper($_POST['customerEmail']);
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");


	$checkID = mysql_query("SELECT * FROM mcustomer WHERE customerID='$customerID'");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==0){
		$getNewID = mysql_query("SELECT COUNT(customerID)+1 as count FROM mcustomer");
		$rowNewID = mysql_fetch_array($getNewID);
		$newID = $rowNewID['count'];
		$custUniqID = "CSR".str_pad($newID, 4, "0", STR_PAD_LEFT);
		$query = "INSERT INTO mcustomer(customerID, customerName, customerPhone, customerEmail, status, dateCreated, lastChanged) VALUES('$custUniqID', '$customerName', '$customerPhone', '$customerEmail', 1, '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);

		$act = "NEW_CUSTOMER_".$customerName;

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_CUSTOMER','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}else{
		$query = "UPDATE mcategory SET
				customerID='$customerID',
				customerName='$customerName',
				customerPhone='$customerPhone',
				customerEmail='$customerEmail',
				lastChanged='$lastChanged'
				WHERE customerID='$customerID'
				";
				$res = mysql_query($query);

			$actUpd = "UPDATE_CUSTOMER_".$customerName;

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_CUSTOMER','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);
		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	$res = mysql_query($query);
	
}
	$URL="/picaPOS/admin/categories"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>