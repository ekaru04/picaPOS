<?php
session_start();  
include("../../assets/config/db.php");

print_r($_POST['categoryID']);
$user      = $_SESSION["userID"];
if (isset($_POST['categoryID']))
{
	$categoryID = $_POST['categoryID'];
	$categoryName = strtoupper($_POST['categoryName']);
	$categoryCode = $_POST['categoryCode'];
	$remarks = $_POST['remarks'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");


	$checkID = mysql_query("SELECT * FROM mcategory WHERE categoryID='$categoryID'");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==0){
		$getNewID = mysql_query("SELECT COUNT(categoryID)+1 as count FROM mcategory");
		$rowNewID = mysql_fetch_array($getNewID);
		$newID = $rowNewID['count'];
		$categoryUniqID = "CF".str_pad($newID, 4, "0", STR_PAD_LEFT);
		$query = "INSERT INTO mcategory(categoryID,categoryName,categoryCode,remarks,status,dateCreated,lastChanged) VALUES('$categoryUniqID', '$categoryName', '$categoryCode', '$remarks', 1, '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);
		
		$act = "INSERT_CATEGORY_".$categoryName;
		
		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_CATEGORY','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);
		
		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}else{
		$query = "UPDATE mcategory SET
				categoryName='$categoryName',
				categoryCode='$categoryCode',
				remarks='$remarks',
				lastChanged='$lastChanged'
				WHERE categoryID='$categoryID'
				";
				$res = mysql_query($query);

			$actUpd = "UPDATE_CATEGORY_".$categoryName;

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_CATEGORY','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);
		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	$res = mysql_query($query);
	
}
	$URL="/picaPOS/admin/categories"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>