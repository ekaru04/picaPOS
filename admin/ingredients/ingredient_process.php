<?php
session_start();  
include("../../assets/config/db.php");

//print_r($_POST['ingredientID']);
$user      = $_SESSION["userID"];
$fullname = $_SESSION['fullname'];
if (isset($_POST['ingredientID']))
{
	$ingredientID = $_POST['ingredientID'];
	$ingredient = strtoupper($_POST['ingredient']);
	$curStock = $_POST['curStock'];
	$minStock = strtoupper($_POST['minStock']);
	$outletID = strtoupper($_POST['outletID']);
	$measurementID = strtoupper($_POST['measurementID']);
	$remarks = $_POST['remarks'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");

    


	$checkID = mysql_query("SELECT * FROM mingredient WHERE ingredientID='$ingredientID'");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==0){
		$getNewID = mysql_query("SELECT COUNT(ingredientID)+1 as count FROM mingredient");
		$rowNewID = mysql_fetch_array($getNewID);
		$newID = $rowNewID['count'];
		$ingreUniqID = "IGR".str_pad($newID, 4, "0", STR_PAD_LEFT);
		$query = "INSERT INTO mingredient(ingredientID,ingredient,curStock,minStock,outletID,measurementID,remarks, status,dateCreated,lastChanged) VALUES('$ingreUniqID', '$ingredient', '$curStock', '$minStock', '$outletID', '$measurementID', '$remarks', 1, '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
		$act = "INSERT_INGREDIENT_".$ingredient;

		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_INGREDIENT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}else{
		$query = "UPDATE mingredient SET
				ingredient='$ingredient',
				curStock='$curStock',
				minStock='$minStock',
				outletID='$outletID',
				measurementID='$measurementID',
				remarks='$remarks',
				lastChanged='$lastChanged'
				WHERE ingredientID='$ingredientID'
				";
				$res = mysql_query($query);

				$journalID = date("YmdHis");

		$actUpd = "UPDATE_INGREDIENT_".$ingredient;

		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_INGREDIENT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	$res = mysql_query($query);
	
}
	$URL="/picaPOS/admin/ingredients"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>