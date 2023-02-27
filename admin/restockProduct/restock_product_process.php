<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");
$date = date("YmdHis");
$user = $_SESSION["userID"];

// echo $user;
if (isset($_POST['submit']))
{
	$productID = $_POST['productID'];
	$type = $_POST['type'];
	$outletID = $_SESSION['outletID'];
	$categoryID = $_POST['categoryID'];
	$curStock = $_POST['curStock'];
	// $user = 1;
	// $user = $_SESSION['userID'];
	$remarks = $_POST['remarks'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");

    $in = "IN";

	$checkID = mysql_query("SELECT * FROM mproduct WHERE productID = '$productID' AND outletID = '$outletID' AND categoryID = '$categoryID' ");
	$rowCheck = mysql_fetch_array($checkID);

	$newStock = $curStock + $rowCheck['curStock'];
	$decStock = $rowCheck['curStock'] - $curStock;

	if(mysql_num_rows($checkID)!=0){
		if($type==1){
			$query = "UPDATE mproduct SET 
						curStock='$newStock',
						remarks='$remarks',
						lastChanged='$lastChanged'
						WHERE productID = '$productID' AND outletID = '$outletID' AND categoryID = '$categoryID'";
			$res = mysql_query($query);
		}else{
			$query = "UPDATE mproduct SET 
						curStock='$decStock',
						remarks='$remarks',
						lastChanged='$lastChanged'
						WHERE productID = '$productID' AND outletID = '$outletID' AND categoryID = '$categoryID'";
			$res = mysql_query($query);
		}

		$journalID = date("YmdHis");
		$act = "RESTOCK_PRODUCT_".$productID."_ON_OUTLET_".$outletID;

		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','RESTOCK_PRODUCT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";

		
	}
	// else{
	// 	$query = "UPDATE mingredient SET
	// 			ingredientID='$ingredientID',
	// 			ingredient='$ingredient',
	// 			minStock='$minStock',
	// 			outletID='$outletID',
	// 			measurementID='$measurementID',
	// 			remarks='$remarks',
	// 			lastChanged='$lastChanged'
	// 			WHERE ingredientID='$ingredientID'
	// 			";
	// 			$res = mysql_query($query);

	// 	echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	// }
	// $res = mysql_query($query);
	
}
	$URL="/picaPOS/admin/products"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>