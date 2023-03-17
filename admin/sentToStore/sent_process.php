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

	if(isset($_POST['submit']))
	{
		$productID = $_POST['productID'];
		$currentStock = $_POST['newStock'];
		$sentStock = $_POST['sentStock'];
		$lastChanged = date("Y-m-d H:i:s");

		$masterDataProduct = mysql_query("SELECT * FROM mproduct WHERE productID = '$productID'");
		$rowMasterDataProduct = mysql_fetch_array($masterDataProduct);
		$masterProduct = $rowMasterDataProduct['productID'];
		$masterProductName = $rowMasterDataProduct['productName'];
		$masterStock = $rowMasterDataProduct['curStock'];

		$dataTempStock = mysql_query("SELECT * FROM tabproductstocktemp WHERE productID = '$productID'");
		$rowTempStock = mysql_fetch_array($dataTempStock);
		$rowProduct = $rowTempStock['productID'];
		$rowStock = $rowTempStock['newStock'];

		$toStore = $rowStock - $sentStock;

		$newMasterStock = $masterStock + $sentStock;

		if($rowStock < $sentStock)
		{
			echo "<script type='text/javascript'>alert('Jumlah stok kurang! Transaksi tidak dapat diproses!')</script>";
			echo "<script type='text/javascript'>location.replace('/picaPOS/admin/sentToStore/stock_input.php?productID=$rowProduct')</script>";
		}
		else
		{
			$updateStockTemp = mysql_query("UPDATE tabproductstocktemp SET newStock = '$toStore' WHERE productID = '$productID'");
			$updateStockMaster = mysql_query("UPDATE mproduct SET curStock = '$newMasterStock', lastChanged = '$lastChanged' WHERE productID = '$productID'");
			echo "<script type='text/javascript'>alert('Stok product ".$masterProductName." berhasil dikirim ke Toko!')</script>";
			echo "<script type='text/javascript'>location.replace('/picaPOS/admin/sentToStore/stock_input.php?productID=$rowProduct')</script>";
		}

		// echo "Product ID : ".$rowTempStock['productID'];
		// echo "<br>";
		// echo "Current Stock : ".$rowTempStock['newStock']." pcs";
		// echo "<br>";
		// echo "Sent to Store : ".$sentStock." pcs";
	}
	else
	{
		echo "Didn't Sent!";
	}

?>