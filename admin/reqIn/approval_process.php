<?php

include("../../assets/config/db.php");
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
$query = mysql_query("SELECT * FROM muser WHERE username = '$_SESSION[username]'");
$data = mysql_fetch_array($query);

/* Mengambil data request production dan meyimpannya dalam variabel */
if(isset($_POST['requestID'])){
	$requestID = $_POST['requestID'];
	$statusApprove = $_POST['status'];
	$reason = $_POST['reason'];
	$today = date("Y-m-d"); 

	// echo $_POST['requestID'];
	// exit;

	$per = date("Ym");
	$tempData = mysql_query("SELECT count(tempID)+1 AS countID FROM tabproductstocktemp");
	$rowTempData = mysql_fetch_array($tempData);
	$countTempData = $rowTempData['countID'];
	$tempID = "PCA/TEMP/$per/".str_pad($count,4,"0",STR_PAD_LEFT);

	$dateCreated = date("Y-m-d");
	$lastChanged = date("Y-m-d H:i:s");
	$user = $data['userID'];

	/* Mengambil data dari tabel berdasarkan requestID yang diminta */
	$requestProductionData = mysql_query("SELECT * FROM tabrequestheader WHERE requestID='$requestID'");
	$rowRequest = mysql_fetch_array($requestProductionData); // <-- Mengecek data
	$productRequest = $rowRequest['productID']; // <-- Menyimpan data produk ID ke variabel
	$outlet = $rowRequest['outletID'];	
	$amountRequest = $rowRequest['amount']; // <-- Menyimpan stok yang diminta sebelumnya kedalam variabel

	/* Logika tentang status approval */
	switch($statusApprove){
		case 1:
			$isPending = 1;
			break;
		case 2:
			$isPending = 0;
			break;
		case 69:
			$isPending = 0;
			break;
	}
	
	/* Apabila status approval 2 (Di approve) */
	if($statusApprove==2){

		/* Mengambil data master produk berdasarkan  */
		$masterProduct = mysql_query("SELECT * FROM mproduct WHERE productID='$productRequest' AND outletID = '$outlet'");
		$rowProduct = mysql_fetch_array($masterProduct); // <-- Cek data produk
		$stockNow = $rowProduct['curStock']; // <-- Menyimpan stok saat ini dari master produk ke variabel

		/* Menambahkan stok produk saat ini dengan stok yang akan diproduksi kedalam variabel */
		// $curStock = $stockNow+$amountRequest;

		/* Mengupdate stock produk sebelumnya dengan stock yang telah diapprove */
		// $updateStockProduct = mysql_query("UPDATE mproduct SET curStock = '$curStock' WHERE productID = '$rowProduct[productID]' AND outletID = '$rowProduct[outletID]'");

		$getDataTempStock = mysql_query("SELECT * FROM tabproductstocktemp WHERE productID = '$productRequest'");
		$rowTempStock = mysql_fetch_array($getDataTempStock);
		$productTemp = $rowTempStock['productID'];
		$stockTemp = $rowTempStock['newStock'];

		$addNewStock = $stockTemp + $amountRequest;
		// echo "Ini ID produk nya ".$rowTempStock['productID'];
		// echo "<br>";
		// echo "Ini stok di dapurnya ".$rowTempStock['newStock'];
		// exit;

		if($productTemp == null){

		/* Tampung ke tabel temp stok product */
		// $tempStock = mysql_query("INSERT INTO tabproductstocktemp(tempID, requestID, productID, newStock, outletID, dateCreated, lastChanged) VALUES('$tempID', '$requestID', '$productRequest', '$amountRequest', '$outlet', '$dateCreated', '$lastChanged')");
		$tempStock = mysql_query("INSERT INTO tabproductstocktemp(productID, newStock, outletID, dateCreated, lastChanged) VALUES('$productRequest', '$amountRequest', '$outlet', '$dateCreated', '$lastChanged')");

		$journalID = date("YmdHis");

		$activityUpdateStock = "UPDATE_STOCK_PRODUCT_".$rowProduct['productID']."_FROM_REQUEST".$requestID;

		$updateJournal = mysql_query("INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID', '$activityUpdateStock', 'RESTOCK_PRODUCT_STOCK', '$user', '$dateCreated', '$lastChanged', 'SUCCESS')");
			
		}else{

		/* Update Stock produk di tabel productstocktemp */
		$updateTempStock = mysql_query("UPDATE tabproductstocktemp SET newStock = '$addNewStock', lastChanged = '$rowTempStock[lastChanged]' WHERE productID = '$productRequest' AND outletID = '$rowTempStock[outletID]'");

		$journalID = date("YmdHis");

		$activityUpdateStock = "UPDATE_STOCK_PRODUCT_".$rowProduct['productID']."_FROM_REQUEST".$requestID;

		$updateJournal = mysql_query("INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID', '$activityUpdateStock', 'RESTOCK_PRODUCT_STOCK', '$user', '$dateCreated', '$lastChanged', 'SUCCESS')");

		}

		$getRequestDetail = mysql_query("SELECT * FROM tabrequestdetail WHERE requestID = '$requestID' and status = $statusApprove-1 ");

		while($fetchRequestDetail = mysql_fetch_array($getRequestDetail)){
			
			//update current stock

			$masterIngredient = mysql_query("SELECT * FROM mingredient WHERE ingredientID = '$fetchRequestDetail[ingredientID]' AND outletID = '$rowRequest[outletID]' AND status = 1");
			$fetchIngredient = mysql_fetch_array($masterIngredient);
			$ingredientCurStock = $fetchIngredient[curStock];
			$ingredientMinStock = $fetchIngredient[minStock];
			
			$requestAmount = $fetchRequestDetail[amount];
			$ingredientNewStock = $ingredientCurStock-$requestAmount;
			
			if($ingredientNewStock < $ingredientMinStock || $ingredientNewStock < 0){
				echo "<script type='text/javascript'>alert('Jumlah stok kurang! Transaksi tidak dapat diproses!')</script>";

				$journalID = date("YmdHis");

				$actStock = "LOW_STOCK_FAILED_TO_UPDATE";

				$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actStock','AMOUNT_STOCK','$user','$dateCreated','$lastChanged', 'FAILED')";
				$resJournal = mysql_query($queryJournal);

				$URL="/picaPOS/admin/reqIn"; 
     			echo "<script type='text/javascript'>location.replace('$URL');</script>";
			}else{
				$lastChanged = date("Y-m-d H:i:s");
				$res = mysql_query("UPDATE mingredient SET curStock = '$ingredientNewStock', lastChanged = '$lastChanged' WHERE ingredientID = '$fetchRequestDetail[ingredientID]' AND outletID = '$rowRequest[outletID]' and status = 1");

				$journalID = date("YmdHis");

				$actStock = "UPDATE_STOCK_INGREDIENT_".$fetchRequestDetail['ingredientID']."_FROM_REQUEST".$requestID;

				$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actStock','AMOUNT_STOCK','$user','$dateCreated','$lastChanged', 'SUCCESS')";
				$resJournal = mysql_query($queryJournal);
				
				//update saldo sisa (ingin berkata kasar)
				$resSaldo = mysql_query("SELECT * FROM tabItemSaldo s  WHERE s.ingredientID = '$fetchRequestDetail[ingredientID]' AND s.outletID = '$rowRequest[outletID]' AND s.status = 1");
				
				$amountLeft = $requestAmount; 
				$duitTotal = 0;
				while($rowSaldo = mysql_fetch_array($resSaldo)){
					if($amountLeft <= 0){

					}else{

						$id = $rowSaldo[id];
						$amountSaldo = $rowSaldo[amount]; 
						$amountUsed = $rowSaldo[amountUsed]; 
						$itemPrice = $rowSaldo[itemPrice]; 
						$totalPrice = $rowSaldo[totalPrice]; 
						$saldoPrice = $rowSaldo[saldo];


						$itemPriceAfterDiscount = $totalPrice / $amountSaldo; 
						// echo $itemPriceAfterDiscount;
						
						$saldo = $amountSaldo-$amountUsed;  
						
						if($amountLeft <= $saldo){ 
							// echo "habis <br/>";
							$amountUsed = $amountUsed + $amountLeft; 
							$saldoPrice = $saldoPrice - ($itemPriceAfterDiscount*$amountLeft); 
							$duitTotal = $duitTotal + ($itemPriceAfterDiscount*$amountLeft);
							$amountLeft = 0; 
							// echo $saldoPrice."<br/>";
							
						}else{ 
							// echo "sisa";
							$amountLeft = $amountLeft - $saldo; 
							$amountUsed = $amountUsed + $saldo; 
							$saldoPrice = $saldoPrice - ($itemPriceAfterDiscount*$saldo);
							$duitTotal = $duitTotal + ($itemPriceAfterDiscount*$saldo);
						}
						
						$res = mysql_query("UPDATE tabItemSaldo SET amountUsed = '$amountUsed',saldo='$saldoPrice' WHERE id ='$id' AND ingredientID = '$fetchRequestDetail[ingredientID]' AND outletID = '$rowRequest[outletID]' and status = 1");

						$journalID = date("YmdHis");
						$actStock = "UPDATE_SALDO_FROM_REQUEST".$requestID;
						$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actStock','AMOUNT_USED_AND_SALDO','$user','$dateCreated','$lastChanged', 'SUCCESS')";
						$resJournal = mysql_query($queryJournal);

					}
				}
				
				// echo $duitTotal;
				//insert ke history
				$journalID = date("YmdHis");
				$dateCreated = date("Y-m-d");
				$lastChanged = date("Y-m-d H:i:s");
				
				$queryT = "INSERT INTO tabitemhistory(id,transType,ingredientID,amount,itemAmount,measurementID,cost,userID,status,dateCreated,lastChanged) VALUES('$journalID', 'OUT', '$fetchRequestDetail[ingredientID]', '$amount', '$amountNow','$fetchRequestDetail[measurementID]','$duitTotal','$user', 1, '$dateCreated', '$lastChanged')";
					
				$resT = mysql_query($queryT);

				$journalID = date("YmdHis");
				$actStock = "INSERT_HISTORY_FROM_REQUEST".$requestID;
				$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actStock','HISTORY','$user','$dateCreated','$lastChanged', 'SUCCESS')";
				$resJournal = mysql_query($queryJournal);

			}
			
		}
		
		
		$query = "UPDATE tabrequestheader SET status = '$statusApprove', isPending = '$isPending', approvedBy = '$user', approvedDate = '$today', approvedReason = '$reason' WHERE requestID = '$requestID'";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
		$actStock = "UPDATE_REQ_HEADER_".$requestID;
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actStock','APPROVAL_REQUEST','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);
		
		$query = "UPDATE tabrequestdetail SET status = '$statusApprove' WHERE requestID = '$requestID'";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
		$actStock = "UPDATE_REQ_DETAIL_".$requestID;
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actStock','STATUS_REQUEST','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);
		
	}else{
		$query = "UPDATE tabrequestheader SET status = '$statusApprove', isPending = '$isPending', approvedBy = '$user', approvedDate = '$today', approvedReason = '$reason' WHERE requestID = '$requestID'";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
		$actStock = "UPDATE_REQ_HEADER_".$requestID;
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actStock','APPROVAL_REQUEST','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);
		
		$query = "UPDATE tabrequestdetail SET status = '$statusApprove' WHERE requestID = '$requestID'";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
		$actStock = "UPDATE_REQ_DETAIL_".$requestID;
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actStock','STATUS_REQUEST','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);
	}

	echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";

}

	$URL="/picaPOS/admin/reqIn"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>