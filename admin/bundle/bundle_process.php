<?php
session_start();  
include("../../assets/config/db.php");

$user      = $_SESSION["userID"];
if (isset($_POST['bundleID'])):

	$bundleID = $_POST['bundleID'];
	$bundleName = strtoupper($_POST['bundleName']);
	$categoryID = $_POST['categoryID'];
	$outletID = $_POST['outletID'];
	$bundlePeriode = $_POST['bundlePeriode'];
	$bundlePrice = $_POST['bundlePrice'];

	$productID = $_POST['productID'];
	$productAmount = $_POST['productAmount'];
	
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");

    $countArr = count($productID);
	
	#Konstanta/variabel yang tidak berubah. taruh diatas jangan didalam suatu loop/logika
	$act = "INSERT_BUNDLE_".$bundleName;
	$actInPro = "INSERT_PRODUCT_BUNDLE_".$bundleName;
	$actUpPro = "UPDATE_PRODUCT_BUNDLE_".$bundleName;
	$actUp = "UPDATE_BUNDLE_".$bundleName;

    
    #hanya cek data header saja
	$checkID = mysql_query("SELECT * FROM tabbundleheader WHERE bundleID='$bundleID'");
	$rowCheck = mysql_fetch_array($checkID);

	mysql_query("DELETE FROM tabbundledetail WHERE bundleID='$bundleID'");

	if(mysql_num_rows($checkID)==0)
	{
		$query = "INSERT INTO tabbundleheader(bundleID,bundleName,categoryID,outletID,bundlePeriode,bundlePrice,status,dateCreated,lastChanged) VALUES('$bundleID', '$bundleName', '$categoryID', '$outletID', '$bundlePeriode', '$bundlePrice', 1, '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);
		
		
		#cek data detail setelah selesai dengan header. Loop terlebih dahulu untuk setiap produk.
		for($x=0; $x<$countArr;$x++)
		{
			$product = $productID[$x];
			$amount = $productAmount[$x];
			
			#cek data detail apakah sudah ada
			$check = mysql_query("SELECT * FROM tabbundledetail WHERE bundleID='$bundleID' AND productID = '$product' AND status = 1");
			$row = mysql_fetch_array($check);
			
			if(mysql_num_rows($check)==0)
			{
				$id = date("YmdHis"); 
				mysql_query("INSERT INTO tabbundledetail(id, bundleID, productID, amount, status, dateCreated, lastChanged) VALUES('$id', '$bundleID', '$product', '$amount', 1, '$dateCreated', '$lastChanged')") or die(mysql_error());
				
				$journalID = date("YmdHis");
				$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actInPro','DETAIL_BUNDLE','$user','$dateCreated','$lastChanged', 'SUCCESS')";
				$resJournal = mysql_query($queryJournal);
			
			}else{
				mysql_query("UPDATE tabbundledetail SET	productID = '$product', amount = '$amount', lastChanged = '$lastChanged'
					WHERE bundleID = '$bundleID' AND productID = '$product' AND status = 1") or die(mysql_error());
					
				$journalID = date("YmdHis");
				$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpPro','DETAIL_BUNDLE','$user','$dateCreated','$lastChanged', 'SUCCESS')";
				$resJournal = mysql_query($queryJournal);
			}
			
		}

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_BUNDLE','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";

	} 

	else
	
	{
		$query = "UPDATE tabbundleheader SET
				bundleID='$bundleID',
				bundleName='$bundleName',
				categoryID='$categoryID',
				outletID='$outletID',
				bundlePeriode='$bundlePeriode',
				bundlePrice='$bundlePrice',
				lastChanged='$lastChanged'
				WHERE bundleID='$bundleID'
				";
		$res = mysql_query($query);
		
		#cek data detail setelah selesai dengan header. Loop terlebih dahulu untuk setiap produk.
		for($x=0; $x<$countArr;$x++)
		{
			$product = $productID[$x];
			$amount = $productAmount[$x];
			
			#cek data detail apakah sudah ada
			$check = mysql_query("SELECT * FROM tabbundledetail WHERE bundleID='$bundleID' AND productID = '$product' AND status = 1");
			$row = mysql_fetch_array($check);
			
			if(mysql_num_rows($check)==0)
			{
				$id = date("YmdHis"); 
				mysql_query("INSERT INTO tabbundledetail(id, bundleID, productID, amount, status, dateCreated, lastChanged) VALUES('$id', '$bundleID', '$product', '$amount', 1, '$dateCreated', '$lastChanged')") or die(mysql_error());
				
				$journalID = date("YmdHis");
				$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actInPro','DETAIL_BUNDLE','$user','$dateCreated','$lastChanged', 'SUCCESS')";
				$resJournal = mysql_query($queryJournal);
			
			}
			else
			{
				mysql_query("UPDATE tabbundledetail SET	productID = '$product', amount = '$amount', lastChanged = '$lastChanged'
					WHERE bundleID = '$bundleID' AND productID = '$product' AND status = 1") or die(mysql_error()); 
					
				$journalID = date("YmdHis");
				$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpPro','DETAIL_BUNDLE','$user','$dateCreated','$lastChanged', 'SUCCESS')";
				$resJournal = mysql_query($queryJournal);
			}
			
		}
		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	 $URL="/picaPOS/admin/bundle/bundle_input.php?bundleID=$bundleID"; 
     echo "<script type='text/javascript'>location.replace('$URL');</script>";

else:
	echo "<script type='text/javascript'>alert('Data Gagal Dirubah!')</script>";
	$URL="/picaPOS/admin/bundle/bundle_input.php?bundleID=$bundleID"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";

endif;
?>