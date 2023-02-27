<?php
session_start();  
include("../../assets/config/db.php");

//print_r($_POST['productID']);
$user      = $_SESSION["userID"];
if (isset($_POST['productID']))
{
	$productID = $_POST['productID'];
	$productName = strtoupper($_POST['productName']);
	$categoryID = $_POST['categoryID'];
	$recipeID = $_POST['recipeID'];
	$curStock = $_POST['curStock'];
	$minStock = $_POST['minStock'];
	$file = $_FILES['fileUpload']['name'];
	$outletID = $_POST['outletID'];
	$measurementID = $_POST['measurementID'];
	$productPrice = $_POST['productPrice'];
	$remarks = $_POST['remarks'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");


	$checkID = mysql_query("SELECT * FROM mproduct WHERE productID='$productID'");
	$rowCheck = mysql_fetch_array($checkID);
	$data = mysql_num_rows($checkID);

	if ($data == 0 ){
		/**
			Jangan dihapus ya
		*/
		// echo $data;

			/* Proses Validasi Upload*/	
			$allowed = array('gif', 'png', 'jpg', 'jpeg');
			$filename = $_FILES['fileUpload']['name'];
			$size = $_FILES['fileUpload']['size'];
			$file_tmp = $_FILES['fileUpload']['tmp_name'];
			$ext = pathinfo($filename, PATHINFO_EXTENSION);
			if (in_array($ext, $allowed)===true) {
			    if($size < 3044070){			
					move_uploaded_file($file_tmp, '../../productImages/'.$filename);
					$query = "INSERT INTO mproduct(productID,productName,categoryID,recipeID,curStock,minStock,outletID,measurementID,productPrice,productImage,remarks,status,dateCreated,lastChanged) 
						VALUES('$productID', '$productName', '$categoryID', '$recipeID', '$curStock', '$minStock', '$outletID', '$measurementID', '$productPrice', '$filename', '$remarks',  1, '$dateCreated', '$lastChanged')";
					$res = mysql_query($query);


					$journalID = date("YmdHis");
					$act = "INSERT_PRODUCT_".$productName;

					$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_PRODUCT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
					$resJournal = mysql_query($queryJournal);
				}else{
					echo "<script type='text/javascript'>alert('File yang diupload harus JPG/PNG dan Max Size 3MB')</script>";
					$journalID = date("YmdHis");
					$act = "FAILED_INSERT_PRODUCT_".$productName;

					$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_PRODUCT','$user','$dateCreated','$lastChanged', 'FAILED')";
					$resJournal = mysql_query($queryJournal);
				}
				echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
			}else{
				echo "<script type='text/javascript'>alert('File yang diupload harus JPG/PNG dan Max Size 3MB')</script>";
				$journalID = date("YmdHis");
					$act = "FAILED_INSERT_PRODUCT_".$productName;

					$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_PRODUCT','$user','$dateCreated','$lastChanged', 'FAILED')";
					$resJournal = mysql_query($queryJournal);
			}	
			/**
				Ini juga jangan dihapus ya hehe
			*/
			// echo $ext;   	
	   
		}else{
		
			if($file==""){
				$query = "UPDATE mproduct SET
							productID='$productID',
							productName='$productName',
							categoryID='$categoryID',
							recipeID='$recipeID',
							curStock='$curStock',
							minStock='$minStock',
							outletID='$outletID',
							measurementID='$measurementID',
							productPrice='$productPrice',
							remarks='$remarks',
							lastChanged='$lastChanged'
								WHERE productID='$productID'";
					$res = mysql_query($query);

					$journalID = date("YmdHis");
					$actUpd = "UPDATE_PRODUCT_".$productName;

					$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_PRODUCT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
					$resJournal = mysql_query($queryJournal);
					echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
			}else{

				/* Proses Validasi Upload*/		
				$allowed = array('gif', 'png', 'jpg', 'jpeg');
				$filename = $_FILES['fileUpload']['name'];
				$size = $_FILES['fileUpload']['size'];
				$file_tmp = $_FILES['fileUpload']['tmp_name'];
				$ext = pathinfo($filename, PATHINFO_EXTENSION);
				/* Cek jika ekstensi sesuai */
				if (in_array($ext, $allowed)===true){
					/* Cek ukuran image */
					if($size < 3044070){
						/* Pindah file image ke direktori destinasi */
						move_uploaded_file($file_tmp, '../../productImages/'.$filename);
						$query = "UPDATE mproduct SET
							productID='$productID',
							productName='$productName',
							categoryID='$categoryID',
							recipeID='$recipeID',
							curStock='$curStock',
							minStock='$minStock',
							outletID='$outletID',
							measurementID='$measurementID',
							productPrice='$productPrice',
							productImage='$filename',
							remarks='$remarks',
							lastChanged='$lastChanged'
								WHERE productID='$productID'";
					$res = mysql_query($query);
					$journalID = date("YmdHis");
					$actUpd = "UPDATE_PRODUCT_".$productName;

					$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_PRODUCT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
					$resJournal = mysql_query($queryJournal);
					}else{
						echo "<script type='text/javascript'>alert('File yang diupload harus JPG/PNG dan Max Size 3MB')</script>";

						$journalID = date("YmdHis");
					$act = "FAILED_INSERT_PRODUCT_".$productName;

					$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_PRODUCT','$user','$dateCreated','$lastChanged', 'FAILED')";
					$resJournal = mysql_query($queryJournal);
					}
					echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
				}else{
					echo "<script type='text/javascript'>alert('File yang diupload harus JPG/PNG/JPEG dan Max Size 3MB')</script>";

					$journalID = date("YmdHis");
					$act = "FAILED_INSERT_PRODUCT_".$productName;

					$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_PRODUCT','$user','$dateCreated','$lastChanged', 'FAILED')";
					$resJournal = mysql_query($queryJournal);
				}
			}
		}
	}
	

	$URL="/picaPOS/admin/products"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>