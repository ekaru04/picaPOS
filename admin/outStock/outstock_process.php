<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");

$checkFlag = 0;

if (isset($_POST['outletID'])) {

	$outletID = $_POST['outletID'];
	$ingredientID = $_POST['ingredientID'];
	$amount = $_POST['amount'];
	$lastUpdateDate = date("Y-m-d H:i:s");

	$getIngredient = mysql_query("SELECT * FROM mingredient WHERE outletID = '$outletID' AND ingredientID = '$ingredientID'");
	$fetchIngredient = mysql_fetch_array($getIngredient);
	$curStock = $fetchIngredient['curStock'];
	$minStock = $fetchIngredient['minStock'];

	$newStock = $curStock-$amount;

	if ($amount >= $fetchIngredient['minStock']) {
		
		echo "<script type='text/javascript'>alert('Jumlah stok saat ini kurang! Transaksi tidak dapat diproses!')</script>";
		$URL="/picaPOS/admin/outStock"; 
		echo "<script type='text/javascript'>location.replace('$URL');</script>";

	} else {
		$checkFlag = 1;
	}

	if ($checkFlag == 1) {
		echo "Stok saat ini :". $newStock;
		$updateStock = mysql_query("UPDATE mingredient set curStock = '$newStock', lastChanged = '$lastUpdateDate' WHERE ingredientID = '$ingredientID' AND outletID = '$outletID'");
	}
	// $totalAmount = $fetchIngredient['curStock']-$amount;

	// echo "Bahan Baku ". $fetch['ingredient'];
	// echo "<br>";
	// echo "Sisa :". $totalAmount;
}