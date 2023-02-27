<?php
session_start();  
include("../../assets/config/db.php");

print_r($_POST['id']);
$user      = $_SESSION["userID"];
if (isset($_POST['priceType']))
{
	$id = $_POST['id'];
	$detail = date('YmdHis');
	// $priceID = $_POST['priceID'];
	$priceType = $_POST['priceType'];
	$outletID = $_POST['outletID'];
	$description = $_POST['description'];
	$productID = $_POST['productID'];
	$price = $_POST['price'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");


	$checkID = mysql_query("SELECT * FROM tabpricedetail WHERE id='$id'");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==0){
		// $query = mysql_query("INSERT INTO tabpriceheader(priceID,priceName,outletID,description,status,dateCreated,lastChanged) VALUES('$priceID', '$priceName', '$outletID', '$description', 1, '$dateCreated', '$lastChanged')");

		$queryDetail = mysql_query("INSERT INTO tabpricedetail(id, priceID, productID, price, status, dateCreated, lastChanged) VALUES('$detail', '$priceType', '$productID', '$price', 1, '$dateCreated', '$lastChanged')");

		$journalID = date("YmdHis");
		$act = "INSERT_PRICE_LIST_".$priceName;

		$queryJournal = mysql_query("INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','PRICE_LIST','$user','$dateCreated','$lastChanged', 'SUCCESS')");

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";

	}else{

		$queryDetail = mysql_query("UPDATE tabpricedetail SET price='$price', lastChanged='$lastChanged' WHERE priceID = '$priceType' AND productID = '$productID'");

		$journalID = date("YmdHis");
		$actUpd = "UPDATE_PRICE_LIST_".$priceName;

		$queryJournal = mysql_query("INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','PRICE_LIST','$user','$dateCreated','$lastChanged', 'SUCCESS')");

		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	
}
	$URL="/picaPOS/admin/priceList"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>