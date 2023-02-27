<?php
session_start();  
include("../../assets/config/db.php");

print_r($_POST['categoryStockID']);
$user      = $_SESSION["userID"];
if (isset($_POST['categoryStockID']))
{
	$categoryStockID = $_POST['categoryStockID'];
	$categoryStockName = strtoupper($_POST['categoryStockName']);
	$categoryStockCode = $_POST['categoryStockCode'];
	$remarks = $_POST['remarks'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");


	$checkID = mysql_query("SELECT * FROM mstockcategory WHERE categoryStockID='$categoryStockID'");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==0){
		$query = "INSERT INTO mstockcategory(categoryStockID,categoryStockName,categoryStockCode,remarks,status,dateCreated,lastChanged) VALUES('$categoryStockID', '$categoryStockName', '$categoryStockCode', '$remarks', 1, '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);

		$act = "INSERT_CATEGORY_".$categoryStockName;

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_CATEGORY_STOCK','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}else{
		$query = "UPDATE mstockcategory SET
				categoryStockID='$categoryStockID',
				categoryStockName='$categoryStockName',
				categoryStockCode='$categoryStockCode',
				remarks='$remarks',
				lastChanged='$lastChanged'
				WHERE categoryStockID='$categoryStockID'
				";
				$res = mysql_query($query);

			$actUpd = "UPDATE_CATEGORY_STOCK".$categoryStockName;

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_CATEGORY_STOCK','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);
		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	$res = mysql_query($query);
	
}
	$URL="/picaPOS/admin/categoriesStock"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>