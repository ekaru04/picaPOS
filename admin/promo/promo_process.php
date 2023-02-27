<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");

print_r($_POST['promoID']);
$user      = $_SESSION["userID"];
if (isset($_POST['promoID']))
{
	$promoID = $_POST['promoID'];
	$promoName = strtoupper($_POST['promoName']);
	$promoType = strtoupper($_POST['promoType']);
	$promoRequirement = strtoupper($_POST['promoRequirement']);
	$outletID = $_POST['outletID'];
	$isDiscount = $_POST['isDiscount'];
	$discount = $_POST['discount'];
	$isMonday = $_POST['isMonday'];
	$isTuesday = $_POST['isTuesday'];
	$isWednesday = $_POST['isWednesday'];
	$isThursday = $_POST['isThursday'];
	$isFriday = $_POST['isFriday'];
	$isSaturday = $_POST['isSaturday'];
	$isSunday = $_POST['isSunday'];
	$remarks = $_POST['remarks'];
	$startDate = $_POST['startDate'];
	$endDate = $_POST['endDate'];
	$remarks = $_POST['remarks'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");

    $date = date('Ymd');

	$checkID = mysql_query("SELECT * FROM mpromo WHERE promoID='$promoID' and status = 1");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==0){
		$promoCode = "PRM-".$date.-$promoID;
		$query = "INSERT INTO mpromo(promoID, promoName,promoType,promoRequirement,outletID,isDiscount,discount,isMonday,isTuesday,isWednesday,isThursday,isFriday,isSaturday,isSunday,startDate,endDate,remarks,status,dateCreated,lastChanged) VALUES('$promoCode', '$promoName', '$promoType', '$promoRequirement', '$outletID','$isDiscount','$discount','$isMonday','$isTuesday','$isWednesday','$isThursday','$isFriday','$isSaturday','$isSunday','$startDate','$endDate', '$remarks', 1, '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);

		$act = "INSERT_PROMO_".$promoName;

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_PROMO','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}else{
		$query = "UPDATE mpromo SET
				promoID='$promoID',
				promoName='$promoName',
				promoType='$promoType',
				promoRequirement='$promoRequirement',
				outletID='$outletID',
				isDiscount='$isDiscount',
				promoID='$promoID',
				isDiscount='$isDiscount',
				discount='$discount',
				isMonday='$isMonday',
				isTuesday='$isTuesday',
				isWednesday='$isWednesday',
				isThursday='$isThursday',
				isFriday='$isFriday',
				isSaturday='$isSaturday',
				isSunday='$isSunday',
				startDate='$startDate',
				endDate='$endDate',
				remarks='$remarks',
				lastChanged='$lastChanged'
				WHERE promoID='$promoID'
				";
				$res = mysql_query($query);

		$actUpd = "UPDATE_PROMO_".$promoName;

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_PROMO','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	
}
	$URL="/picaPOS/admin/promo"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>