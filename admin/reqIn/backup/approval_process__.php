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


if(isset($_POST['requestID'])){
	$requestID = $_POST['requestID'];
	$status = $_POST['status'];
	$reason = $_POST['reason'];
	$today = date("Y-m-d"); 

	$dateCreated = date("Y-m-d");
	$lastChanged = date("Y-m-d H:i:s");
	$user = $data['userID'];


	$queryS = mysql_query("SELECT * FROM tabrequestheader WHERE requestID='$requestID'");
	$rowCheck = mysql_fetch_array($queryS);
	
	switch($status){
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
	
	
	if($status==2){
		$queryProduct = mysql_query("SELECT * FROM mproduct WHERE productID='$rowCheck[productID]' AND outletID = '$rowCheck[outletID]'");
		$rowC = mysql_fetch_array($queryProduct);
		$curStock = $rowC['curStock']+$rowCheck['amount'];

		$queyUpd = mysql_query("UPDATE mproduct SET curStock = '$curStock' WHERE productID = '$rowCheck[productID]' AND outletID = '$rowCheck[outletID]'");

		$journalID = date("YmdHis");

		$actStock = "UPDATE_STOCK_PRODUCT_".$rowCheck['productID']."_FROM_REQUEST".$requestID;

		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actStock','TRANSACTION_RESTOCK','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		$queryIng = mysql_query("SELECT * FROM tabrequestdetail WHERE requestID = '$requestID' and status = $status-1 ");

		while($rowIng = mysql_fetch_array($queryIng)){
			
			//update current stock

			$resI = mysql_query("SELECT * FROM mingredient WHERE ingredientID = '$rowIng[ingredientID]' AND outletID = '$rowCheck[outletID]' AND status = 1");
			$rowI = mysql_fetch_array($resI);
			$curStock = $rowI[curStock];
			$minStock = $rowI[minStock];
			
			$amount = $rowIng[amount];
			$amountNow = $curStock-$amount;
			
			if($amountNow < $minStock || $amountNow < 0){
				echo "<script type='text/javascript'>alert('Jumlah stok kurang! Transaksi tidak dapat diproses!')</script>";

				$journalID = date("YmdHis");

				$actStock = "LOW_STOCK_FAILED_TO_UPDATE";

				$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actStock','AMOUNT_STOCK','$user','$dateCreated','$lastChanged', 'FAILED')";
				$resJournal = mysql_query($queryJournal);

				$URL="/picaPOS/admin/reqIn"; 
     			echo "<script type='text/javascript'>location.replace('$URL');</script>";
			}else{
				$lastChanged = date("Y-m-d H:i:s");
				$res = mysql_query("UPDATE mingredient SET curStock = '$amountNow', lastChanged = '$lastChanged' WHERE ingredientID = '$rowIng[ingredientID]' AND outletID = '$rowCheck[outletID]' and status = 1");

				$journalID = date("YmdHis");

				$actStock = "UPDATE_STOCK_INGREDIENT_".$rowIng['ingredientID']."_FROM_REQUEST".$requestID;

				$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actStock','AMOUNT_STOCK','$user','$dateCreated','$lastChanged', 'SUCCESS')";
				$resJournal = mysql_query($queryJournal);
				
				//update saldo sisa (ingin berkata kasar)
				$resSaldo = mysql_query("SELECT * FROM tabItemSaldo s  WHERE s.ingredientID = '$rowIng[ingredientID]' AND s.outletID = '$rowCheck[outletID]' AND s.status = 1");
				
				$amountLeft = $amount; 
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
						
						$res = mysql_query("UPDATE tabItemSaldo SET amountUsed = '$amountUsed',saldo='$saldoPrice' WHERE id ='$id' AND ingredientID = '$rowIng[ingredientID]' AND outletID = '$rowCheck[outletID]' and status = 1");

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
				
				$queryT = "INSERT INTO tabitemhistory(id,transType,ingredientID,amount,itemAmount,measurementID,cost,userID,status,dateCreated,lastChanged) VALUES('$journalID', 'OUT', '$rowIng[ingredientID]', '$amount', '$amountNow','$rowIng[measurementID]','$duitTotal','$user', 1, '$dateCreated', '$lastChanged')";
					
				$resT = mysql_query($queryT);

				$journalID = date("YmdHis");
				$actStock = "INSERT_HISTORY_FROM_REQUEST".$requestID;
				$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actStock','HISTORY','$user','$dateCreated','$lastChanged', 'SUCCESS')";
				$resJournal = mysql_query($queryJournal);

			}
			
		}
		
		
		$query = "UPDATE tabrequestheader SET status = '$status', isPending = '$isPending', approvedBy = '$user', approvedDate = '$today', approvedReason = '$reason' WHERE requestID = '$requestID'";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
		$actStock = "UPDATE_REQ_HEADER_".$requestID;
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actStock','APPROVAL_REQUEST','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);
		
		$query = "UPDATE tabrequestdetail SET status = '$status' WHERE requestID = '$requestID'";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
		$actStock = "UPDATE_REQ_DETAIL_".$requestID;
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actStock','STATUS_REQUEST','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);
		
	}else{
		$query = "UPDATE tabrequestheader SET status = '$status',isPending = '$isPending', approvedBy = '$user', approvedDate = '$today', approvedReason = '$reason' WHERE requestID = '$requestID'";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
		$actStock = "UPDATE_REQ_HEADER_".$requestID;
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actStock','APPROVAL_REQUEST','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);
		
		$query = "UPDATE tabrequestdetail SET status = '$status' WHERE requestID = '$requestID'";
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