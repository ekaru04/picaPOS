<?php
session_start();  
include("../../assets/config/db.php");

// print_r($_POST['priceID']);
$user      = $_SESSION["userID"];
if (isset($_POST['priceID']))
{
	$detail = date('YmdHis');
	$priceID = $_POST['priceID'];
	$priceName = strtoupper($_POST['priceName']);
	$outletID = $_POST['outletID'];
	$description = $_POST['description'];
	// $productID = $_POST['productID'];
	// $price = $_POST['price'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");


	$checkID = mysql_query("SELECT * FROM tabpriceheader WHERE priceID='$priceID'");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==0){
		$query = mysql_query("INSERT INTO tabpriceheader(priceID,priceName,outletID,description,status,dateCreated,lastChanged) VALUES('$priceID', '$priceName', '$outletID', '$description', 1, '$dateCreated', '$lastChanged')");

		$queryDetail = mysql_query("INSERT INTO tabpricedetail(id, priceID, productID, price, status, dateCreated, lastChanged) VALUES('$detail', '$priceID', '$productID', '$price', 1, '$dateCreated', '$lastChanged')");

		$journalID = date("YmdHis");
		$act = "INSERT_MASTER_PRICE_".$priceName;

		$queryJournal = mysql_query("INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_PRICE','$user','$dateCreated','$lastChanged', 'SUCCESS')");

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";

	}else{

		$query = mysql_query("UPDATE tabpriceheader SET	priceID='$priceID', priceName='$priceName',	outletID='$outletID', description='$description', lastChanged='$lastChanged' WHERE priceID='$priceID'");
		$queryDetail = mysql_query("UPDATE tabpricedetail SET price='$price', lastChanged='$lastChanged' WHERE priceID = '$priceID' AND productID = '$productID'");

		$journalID = date("YmdHis");
		$actUpd = "UPDATE_MASTER_PRICE_".$priceName;

		$queryJournal = mysql_query("INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_PRICE','$user','$dateCreated','$lastChanged', 'SUCCESS')");
		// $resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	
}
	$URL="/picaPOS/admin/mPrices"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>