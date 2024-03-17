<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");
$date = date("YmdHis");
// print_r($_POST['transID']);
// $user      = $_POST["userID"];

// echo $user;
if (isset($_POST['transItemID']))
{
	$transItemID = $_POST['transItemID'];
	$transDate = $_POST['transDate'];
	$supplierID = $_POST['supplierID'];
	$outletID = $_POST['outletID'];
	$categoryStockID = $_POST['categoryStockID'];
	$stockID = $_POST['stockID'];
	$amountBuy = $_POST['amount'];
	$measurementID = $_POST['measurementID'];
	$totalPrice = $_POST['totalPrice'];
	$discount = $_POST['discount'];
	$discountPrice = $totalPrice*($discount/100);
	$user = $_SESSION['userID'];
	$remarks = $_POST['remarks'];
	$dateCreated = date("Y-m-d H:i:s");
    $lastChanged = date("Y-m-d H:i:s");

	$idStockHistory = date("YmdHis");

    $in = "IN";

    $afterDisc = $totalPrice-$discountPrice;


	$checkID = mysql_query("SELECT * FROM mstock WHERE stockID='$stockID'");
	$rowCheck = mysql_fetch_array($checkID);
	$curStock = $rowCheck['curStock'];
	$stockMeasure = $rowCheck['measurementID'];
	$stockAmount = $amountBuy+$curStock;

	if($measurementID != $stockMeasure) {
		echo "<script type='text/javascript'>alert('Satuan Dasar Bahan tidak cocok! Transaksi tidak dapat diproses!')</script>";
		$URL="/picaPOS/admin/restockIngredient/restock_input.php"; 
		echo "<script type='text/javascript'>location.replace('$URL');</script>";
	} else {

		$checkTransID = mysql_query("SELECT * FROM tabstocktransaction WHERE transItemID='$transItemID'");
		// $rowCheck = mysql_fetch_array($checkTransID);
	
		if(mysql_num_rows($checkTransID)==0){
			$transCode = "TRXI-".$date;
			$query = "INSERT INTO tabstocktransaction(transItemID, transItemDate, supplierID, outletID, stockID, amountBuy, stockAmount, totalPrice, discount, discountPrice, afterDiscount, measurementID, userID, remarks, dateCreated, lastChanged) 
						VALUES('$transCode', '$transDate', '$supplierID', '$outletID', '$stockID', '$amountBuy', '$stockAmount', '$totalPrice', '$discount', '$discountPrice', '$afterDisc', '$measurementID', '$user', '$remarks', '$dateCreated', '$lastChanged')";
			$res = mysql_query($query);
	
			$queryU = "UPDATE mstock SET 
						curStock='$stockAmount' 
						WHERE stockID = '$stockID'";
			$resU = mysql_query($queryU);

			$stockHistory = mysql_query("INSERT INTO tabstockhistory(id, transStockType, stockID, amount, currentStockAmount, measurementID, cost, userID, status, dateCreated, lastChanged)
											VALUES('$idStockHistory', 'IN/RESTOCK', '$stockID', '$amountBuy', '$stockAmount', '$measurementID', '$afterDisc', '$user', 1, '$dateCreated', '$lastChanged')");
	
			// $allTransQuery = mysql_query("INSERT INTO taballtransaction(transID, transDate, supplierID, outletID, stuffID, measurementID, amountBuy, currentStock, totalPrice, discount, discountPrice, userID, remarks, dateCreated, lastChanged)
			// 								VALUES()");
			// $journalID = date("YmdHis");
			// 			$act = "INSERT_RESTOCK_".$transID;
	
			// 			$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','TRANSACTION_RESTOCK','$user','$dateCreated','$lastChanged', 'SUCCESS')";
			// 			$resJournal = mysql_query($queryJournal);
	
			echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
		}
		
	}
}
	$URL="/picaPOS/admin/restockItem"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>