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
	$stockReq = $_POST['curStock'];
	$remarks = $_POST['remarks'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");

	/** Mengambil data dari mproduct */
	$checkID = mysql_query("SELECT * FROM mproduct WHERE productID = '$productID' AND outletID = '$outletID' AND categoryID = '$categoryID' ");
	$rowCheck = mysql_fetch_array($checkID);

	$decStock = $rowCheck['curStock'] - $stockReq;
	$minimumStock = $rowCheck['minStock'];

	/** Ambil stok dari tempstock kemudian ditambahkan ke stok asli produknya */
	$getTempStock = mysql_query("SELECT * FROM tabtempstock WHERE productID = '$productID'");
	$fetchStock = mysql_fetch_array($getTempStock);
	$tempStock = $fetchStock['tempStock'];
	$totalStock = $rowCheck['curStock']+$tempStock;
	$sendStock = $tempStock-$stockReq;


	if(mysql_num_rows($checkID) != 0){
		/** Jika tipe req IN atau 1 */
		if( $type == 1 ){
			/** Validasi data produk di tabtempstock */
			if($fetchStock['productID'] =! 0) {
							
				/** Jika produknya ada */
				if($stockReq > $tempStock || $tempStock == 0) {
					/** Jika stok yang diminta melebihi stok di tabtempstock */
					echo "<script type='text/javascript'>alert('Stok yang diminta melebihi stok dapur/kosong, permintaan tidak dapat diproses!')</script>";
					$URL="/picaPOS/admin/restockProduct/restock_input.php"; 
					echo "<script type='text/javascript'>location.replace('$URL');</script>";
					
				} else {
					/** Jika stok yang diminta tidak melebihi di tabtempstock */
					$stokIn = $rowCheck['curStock']+$stockReq;
					$updateStock = mysql_query("UPDATE mproduct SET curStock = '$stokIn', remarks = '$remarks', lastChanged = '$lastChanged' 
											WHERE productID = '$productID' AND outletID = '$outletID' AND categoryID = '$categoryID'");
					$updateStkTemp = mysql_query("UPDATE tabtempstock SET tempStock = '$sendStock' WHERE productID = '$productID'");

					echo "<script type='text/javascript'>alert('Stok telah ditambahkan ke Toko!')</script>";
					$URL="/picaPOS/admin/restockProduct/restock_input.php"; 
					echo "<script type='text/javascript'>location.replace('$URL');</script>";
				}
			
			} else {
				
				/** Jika produknya gada */
				echo "<script type='text/javascript'>alert('Produk yang diminta tidak ada, permintaan tidak dapat diproses!')</script>";
				$URL="/picaPOS/admin/restockProduct/restock_input.php"; 
    			echo "<script type='text/javascript'>location.replace('$URL');</script>";	

			}
			
		} else {

			// echo "masuk sini";
			// echo $stockReq;
			// echo "<br>";
			// echo $minimumStock;
			// exit;
			if($stockReq > $rowCheck['curStock']) {
				/** Jika stok produk yang dikeluarkan melebihi current stock */	
				// echo "test";
				// exit;			
				echo "<script type='text/javascript'>alert('Stok yang dikeluarkan melebihi jumlah stok saat ini, permintaan tidak dapat diproses!')</script>";
				$URL="/picaPOS/admin/restockProduct/restock_input.php"; 
				echo "<script type='text/javascript'>location.replace('$URL');</script>";
				// exit;

			} else {
				
				echo "<script type='text/javascript'>alert('Stok yang dikeluarkan $stockReq, sisa stok tersisa $rowCheck[curStock]. Permintaan sudah diproses!')</script>";
				$URL="/picaPOS/admin/restockProduct/restock_input.php"; 
				echo "<script type='text/javascript'>location.replace('$URL');</script>";
				// exit;
				$query = "UPDATE mproduct SET 
							curStock='$decStock',
							remarks='$remarks',
							lastChanged='$lastChanged'
							WHERE productID = '$productID' AND outletID = '$outletID' AND categoryID = '$categoryID'";
				$res = mysql_query($query);
				
			}

		}

		$journalID = date("YmdHis");
		$act = "RESTOCK_PRODUCT_".$productID."_ON_OUTLET_".$outletID;

		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','RESTOCK_PRODUCT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		// $resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";

		
	} else {
		
	}
	
}
	$URL="/picaPOS/admin/products"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>