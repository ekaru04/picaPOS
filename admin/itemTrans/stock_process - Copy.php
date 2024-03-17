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
	$id = $_POST['id'];
	$stockID = $_POST['stockID'];
	$type = $_POST['type'];
	$outletID = $_SESSION['outletID'];
	$categoryStockID = $_POST['categoryStockID'];
	$amount = $_POST['amount'];
	$pic = $_POST['pic'];
	$file = $_FILES['fileUpload']['name'];
	$price = $_POST['price'];
	$remarks = $_POST['remarks'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");

	$checkID = mysql_query("SELECT * FROM mstock WHERE stockID = '$stockID' AND outletID = '$outletID' AND categoryStockID = '$categoryStockID'");
	$rowCheck = mysql_fetch_array($checkID);

	$addStock = $amount + $rowCheck['curStock'];
	$decStock = $rowCheck['curStock'] - $amount;

	

	if(mysql_num_rows($checkID)!=0)
	{
		if($type=="OUT")
		{

			$allowed = array('gif', 'png', 'jpg', 'jpeg');
			$filename = $_FILES['fileUpload']['name'];
			$size = $_FILES['fileUpload']['size'];
			$file_tmp = $_FILES['fileUpload']['tmp_name'];
			$ext = pathinfo($filename, PATHINFO_EXTENSION);
			if(in_array($ext, $allowed) === true)
			{
				if($size < 3044070)
				{
					move_uploaded_file($file_tmp, '../../receiptImages/'.$filename);
					$queryI = mysql_query("INSERT INTO tabstocktransaction(id, stockID, categoryStockID, measurementID, userID, amount, stockAmount, price, photoName, type, remarks, status, outletID, pic, dateCreated, lastChanged) VALUES('$id','$stockID', '$categoryStockID', '$rowCheck[measurementID]', '$user', '$amount', '$addStock', '$price', '$file', '$type', '$remarks', 'SUCCESS', '$outletID', '$pic', '$dateCreated', '$lastChanged')");

					$queryU = mysql_query("UPDATE mstock SET 
										curStock = '$addStock',
										lastChanged = '$lastChanged'
										WHERE stockID = '$rowCheck[stockID]' AND outletID = '$rowCheck[outletID]' AND categoryStockID = '$rowCheck[categoryStockID]'");
				}
				else
				{
					echo "<script type='text/javascript'>alert('File yang diupload harus JPG/PNG dan Max Size 3MB')</script>";
					$journalID = date("YmdHis");
					$act = "FAILED_INSERT_RECEIPT_".$productName;

					$queryJournal = mysql_query("INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','ITEM_TRX','$user','$dateCreated','$lastChanged', 'FAILED')");
				}
			}
			else
			{
				echo "<script type='text/javascript'>alert('File yang diupload harus JPG/PNG dan Max Size 3MB')</script>";
					$journalID = date("YmdHis");
					$act = "FAILED_INSERT_RECEIPT_".$productName;

					$queryJournal = mysql_query("INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','ITEM_TRX','$user','$dateCreated','$lastChanged', 'FAILED')");
			}
			
		}
		else
		{

			$queryI = mysql_query("INSERT INTO tabstocktransaction(id, stockID, categoryStockID, measurementID, userID, amount, stockAmount, type, remarks, status, outletID, pic, dateCreated, lastChanged) VALUES('$id','$stockID', '$categoryStockID', '$rowCheck[measurementID]', '$user', '$amount', '$decStock', '$type', '$remarks', 'SUCCESS', '$outletID', '$pic', '$dateCreated', '$lastChanged')");

			$query = mysql_query("UPDATE mstock SET 
									curStock = '$decStock',
									lastChanged = '$lastChanged'
									WHERE stockID = '$rowCheck[stockID]' AND outletID = '$rowCheck[outletID]' AND categoryStockID = '$rowCheck[categoryStockID]'");

		}

		$journalID = date("YmdHis");
		$act = "RESTOCK_PRODUCT_".$stockID."_ON_OUTLET_".$outletID;

		$queryJournal = mysql_query("INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','IN/OUT_ITEM','$user','$dateCreated','$lastChanged', 'SUCCESS')");

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
	$URL="/picaPOS/admin/itemTrans"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>