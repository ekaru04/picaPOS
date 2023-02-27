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
if (isset($_POST['transID']))
{
	$transID = $_POST['transID'];
	$transDate = $_POST['transDate'];
	$supplierID = $_POST['supplierID'];
	$outletID = $_POST['outletID'];
	$ingredientID = $_POST['ingredientID'];
	$amount = $_POST['amount'];
	$measurementID = $_POST['measurementID'];
	$itemPrice = $_POST['itemPrice'];
	$totalPrice = $itemPrice*$amount;
	$discount = $_POST['discount'];
	$discountPrice = $totalPrice*($discount/100);
	// $user = 1;
	$user = $_SESSION['userID'];
	$remarks = $_POST['remarks'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");

    $in = "IN";

    $afterDisc = $totalPrice-$discountPrice;

    $saldo = $afterDisc;


	$checkID = mysql_query("SELECT * FROM mingredient WHERE ingredientID='$ingredientID'");
	$rowCheck = mysql_fetch_array($checkID);
	$curStock = $rowCheck['curStock'];
	$itemAmount = $amount+$curStock;

	$checkSaldoID = mysql_query("SELECT count(id) as id FROM tabitemsaldo");
	$rowCheck = mysql_fetch_array($checkSaldoID);
	$id = $rowCheck['id'];

	$checkTransID = mysql_query("SELECT * FROM tabitemtransaction WHERE transID='$transID'");
	$rowCheck = mysql_fetch_array($checkTransID);

	if(mysql_num_rows($checkTransID)==0){
		$transCode = "TRX-".$date;
		$query = "INSERT INTO tabitemtransaction(transID,transDate,supplierID,outletID,ingredientID,amount,itemAmount,itemPrice,totalPrice,discount,discountPrice,measurementID,userID,remarks,dateCreated,lastChanged) VALUES('$transCode', '$transDate', '$supplierID', '$outletID', '$ingredientID', '$amount', '$itemAmount', '$itemPrice', '$totalPrice', '$discount', '$discountPrice', '$measurementID', '$user', '$remarks', '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);


		$queryD = "INSERT INTO tabitemsaldo(id,transID,ingredientID,supplierID,outletID,amount,amountUsed,measurementID,itemPrice,totalPrice,saldo,status,dateCreated,lastChanged) VALUES('$date', '$transCode', '$ingredientID', '$supplierID', '$outletID', '$amount', 0, '$measurementID','$itemPrice','$afterDisc','$saldo', 1, '$dateCreated', '$lastChanged')";
		$resD = mysql_query($queryD);

		$queryU = "UPDATE mingredient SET 
					curStock='$itemAmount' 
					WHERE ingredientID = '$ingredientID'";
		$resU = mysql_query($queryU);

		$queryT = "INSERT INTO tabitemhistory(id,transType,ingredientID,amount,itemAmount,measurementID,cost,userID,status,dateCreated,lastChanged) VALUES('$date', '$in', '$ingredientID', '$amount', '$itemAmount','$measurementID','$afterDisc','$user', 1, '$dateCreated', '$lastChanged')";
		$resT = mysql_query($queryT);

		$journalID = date("YmdHis");
					$act = "INSERT_RESTOCK_".$transID;

					$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','TRANSACTION_RESTOCK','$user','$dateCreated','$lastChanged', 'SUCCESS')";
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
	$URL="/picaPOS/admin/restock"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>