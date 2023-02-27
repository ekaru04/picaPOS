<?php
session_start();  
include("../../assets/config/db.php");

//print_r($_POST['ingredientID']);
$user      = $_SESSION["userID"];
$fullname = $_SESSION['fullname'];
if (isset($_POST['stockID']))
{
	$stockID = $_POST['stockID'];
	$stockName = strtoupper($_POST['stockName']);
	$categoryStockID = $_POST['categoryStockID'];
	$measurementID = $_POST['measurementID'];
	$curStock = $_POST['curStock'];
	$minStock = $_POST['minStock'];
	$outletID = $_POST['outletID'];
	$remarks = $_POST['remarks'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");

    


	$checkID = mysql_query("SELECT * FROM mstock WHERE stockID='$stockID'");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==0){
		$query = "INSERT INTO mstock(stockID,stockName,categoryStockID,measurementID,curStock,minStock,outletID,remarks, status,dateCreated,lastChanged) VALUES('$stockID', '$stockName', '$categoryStockID', '$measurementID', '$curStock', '$minStock', '$outletID', '$remarks', 1, '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
		$act = "INSERT_ITEM_".$stockName;

		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_STOCK','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}else{
		$query = "UPDATE mstock SET
				stockID='$stockID',
				stockName='$stockName',
				categoryStockID='$categoryStockID',
				measurementID='$measurementID',
				curStock='$curStock',
				minStock='$minStock',
				outletID='$outletID',
				remarks='$remarks',
				lastChanged='$lastChanged'
				WHERE stockID='$stockID'
				";
				$res = mysql_query($query);

				$journalID = date("YmdHis");

		$actUpd = "UPDATE_STOCK_".$stockName;

		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_STOCK','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	$res = mysql_query($query);
	
}
	$URL="/picaPOS/admin/itemStock"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>