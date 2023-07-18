<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");

$checkFlag = 0;
$query = mysql_query("SELECT * FROM muser WHERE username = '$_SESSION[username]'");
$data = mysql_fetch_array($query);
$user = $data['userID'];

if (isset($_POST['outletID'])) {

	$outletID = $_POST['outletID'];
	$ingredientID = $_POST['ingredientID'];
	$throwAmount = $_POST['amount'];
	$dateCreated = date("Y-m-d H:i:s");
	$lastUpdateDate = date("Y-m-d H:i:s");

	$getIngredient = mysql_query("SELECT * FROM mingredient WHERE outletID = '$outletID' AND ingredientID = '$ingredientID'");
	$fetchIngredient = mysql_fetch_array($getIngredient);
	$curStock = $fetchIngredient['curStock'];
	$minStock = $fetchIngredient['minStock'];
	$measurementID = $fetchIngredient['measurementID'];

	$newStock = $curStock-$throwAmount;

	if ($throwAmount >= $fetchIngredient['curStock']) {
		
		echo "<script type='text/javascript'>alert('Jumlah stok saat ini kurang! Transaksi tidak dapat diproses!')</script>";
		$URL="/picaPOS/admin/outStock"; 
		echo "<script type='text/javascript'>location.replace('$URL');</script>";

	} else {
		$checkFlag = 1;
	}

	if ($checkFlag == 1) {
		// echo "Stok saat ini :". $newStock;
		$updateStock = mysql_query("UPDATE mingredient set curStock = '$newStock', lastChanged = '$lastUpdateDate' WHERE ingredientID = '$ingredientID' AND outletID = '$outletID'");

		$getFirstSaldo = mysql_query("SELECT * FROM tabItemSaldo s WHERE s.ingredientID = '$ingredientID' AND s.outletID = '$outletID' AND s.status = 1 ORDER BY s.dateCreated ASC");
		$fetchSaldo = mysql_fetch_array($getFirstSaldo);
				
		$amountLeft = $throwAmount; // isinya jumlah produk yg ingin dibuat tadi
		$duitTotal = 0;
		$totalCost = 0;
		
		$id = $fetchSaldo[id];
		$amountSaldo = $fetchSaldo[amount]; // bahan baku yang masuk dari form restock ingredient
		$amountUsed = $fetchSaldo[amountUsed]; // bahan baku yg digunakan sebelumnya ada brp
		$itemPrice = $fetchSaldo[itemPrice]; // harga bahan baku awal yg sebelumnya apabila belum habis saldonya
		$totalPrice = $fetchSaldo[totalPrice]; // total harga bahan baku berdasarkan amount yg masuk dijumlahkan
		$saldoPrice = $fetchSaldo[saldo]; // saldo yang tersisa
		// echo $amountUsed;
		// exit;

		$itemPriceAfterDiscount = $totalPrice / $amountSaldo; 
						// echo $itemPriceAfterDiscount; /* isinya 10000 */
						// exit;
						
		$saldo = $amountSaldo-$amountUsed;  
						// echo $saldo; /* Isinya sisa stok bahan baku */
						// echo $saldoPrice;
						// exit;

		if ($amountLeft < $saldo) { 
							// echo "habis <br/>";
			$amountUsed = $amountUsed + $amountLeft; 
			$saldoPrice = $saldoPrice - ($itemPriceAfterDiscount*$amountLeft); 
			$duitTotal = $duitTotal + ($itemPriceAfterDiscount*$amountLeft);
			$amountLeft = 0; 
							// echo $saldoPrice."<br/>";
							// exit;
							
		} elseif ($amountLeft == $saldo) { 
							// echo "kebetulan borong";
			$amountLeft = $saldo; 
			$amountUsed = $amountUsed + $amountSaldo; 
			$saldoPrice = $saldoPrice - ($itemPriceAfterDiscount*$amountSaldo);
			$duitTotal = $duitTotal + ($itemPriceAfterDiscount*$amountSaldo);
		
		} else { 
							// echo "sisa";
			$amountLeft = $amountLeft - $saldo; 
			$amountUsed = $amountUsed + $saldo; 
			$saldoPrice = $saldoPrice - ($itemPriceAfterDiscount*$saldo);
			$duitTotal = $duitTotal + ($itemPriceAfterDiscount*$saldo);
		
		}
						echo $saldoPrice;
						exit;
		$res = mysql_query("UPDATE tabItemSaldo SET amountUsed = '$amountUsed', saldo='$saldoPrice' WHERE id ='$id' AND ingredientID = '$ingredientID' AND outletID = '$outletID' and status = 1");

		$journalID = date("YmdHis");
		$actStock = "UPDATE_SALDO_FROM_REQUEST".$requestID;
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actStock','AMOUNT_USED_AND_SALDO','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);
				
				// echo $duitTotal;
				//insert ke history
		$journalID = date("YmdHis");
		// $dateCreated = date("Y-m-d0");
		$lastChanged = date("Y-m-d H:i:s");
			
		$queryT = "INSERT INTO tabitemhistory(id,transType,ingredientID,amount,itemAmount,measurementID,cost,userID,status,dateCreated,lastChanged) 
					VALUES('$journalID', 'OUT', '$ingredientID', '$throwAmount', '$newStock','$measurementID',
					'$duitTotal','$user', 1, '$dateCreated', '$lastUpdateDate')";						
		$resT = mysql_query($queryT);

		$journalID = date("YmdHis");
		$actStock = "INSERT_HISTORY_FROM_REQUEST".$requestID;
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actStock','HISTORY','$user','$dateCreated','$lastUpdateDate', 'SUCCESS')";

	}
	// $totalAmount = $fetchIngredient['curStock']-$amount;

	// echo "Bahan Baku ". $fetch['ingredient'];
	// echo "<br>";
	// echo "Sisa :". $totalAmount;
}