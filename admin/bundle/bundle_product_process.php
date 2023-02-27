<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");
$user      = $_SESSION["userID"];
if(isset($_POST['product'])){
	$bundleID = $_POST['bundleID'];
	$productID = $_POST['product'];
	$productAmount = $_POST['amount'];
	
	$journalID = date("YmdHis");
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");
	
	$checkID = mysql_query("SELECT * FROM tabbundledetail WHERE bundleID='$bundleID' AND productID = '$productID' AND status = 1");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==0){
		$query = "INSERT INTO tabbundledetail (id,bundleID,productID,amount,status,dateCreated,lastChanged) VALUES ('$journalID','$bundleID','$productID','$productAmount',1,'$dateCreated','$lastChanged')";
		$res = mysql_query($query);

		$act = "INSERT_RECIPE_INGREDIENT_".$productID."($bundleID)";

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','DETAIL_PRODUCT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);
	}else{
		$query = "UPDATE tabbundledetail SET
						productID = '$productID',
						amount = '$productAmount',
						lastChanged = '$lastChanged'
					WHERE bundleID='$bundleID' AND productID='$productID' AND status = 1";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','UPDATE_RECIPE_INGREDIENT','DETAIL_RECIPE','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);
	}
	// $res = mysql_query($query);
	
	echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	$URL="/picaPOS/admin/bundle/bundle_input.php?bundleID=$bundleID"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
?>