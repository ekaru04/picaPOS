<?php
session_start();  
include("../../assets/config/db.php");

$user = $_SESSION["userID"];
$outlet = $_SESSION["outletID"];

if (isset($_POST['openID']))
{
	$openID = $_POST['openID'];
	$openDate = $_POST['openDate'];
	$period = $_POST['periode'];
	$modal = $_POST['modal'];
	$dateCreated = date("Y-m-d H:i:s");
    $lastChanged = date("Y-m-d H:i:s");

	$checkOpenID = mysql_query("SELECT * FROM tabopencashier WHERE openID='$openID'");
	$rowCheck = mysql_fetch_array($checkOpenID);

	if(mysql_num_rows($checkOpenID) == 0){
		$insertOpen = mysql_query("INSERT INTO tabopencashier (openID, openDate, openPeriode, outletID, nominalOpen, userID, dateCreated, lastChanged)
									VALUES ('$openID', '$openDate', '$period', '$outlet', '$modal', '$user', '$dateCreated', '$lastChanged')");

		$journalID = date("YmdHis");
		$act = "OPEN_CASHIER_".$openID;

		$queryJournal = mysql_query("INSERT INTO systemJournal(journalID, activity, menu, userID, dateCreated, logCreated, status) 
										VALUES('$journalID', '$act', 'OPEN_CASHIER', '$user', '$dateCreated', '$lastChanged', 'SUCCESS')");
		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}
}
	$URL="/picaPOS/app/pos"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>