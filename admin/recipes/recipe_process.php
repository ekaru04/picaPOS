<?php
session_start();  
include("../../assets/config/db.php");

print_r($_POST['recipeID']);
$user      = $_SESSION["userID"];
if (isset($_POST['recipeID']))
{
	$recipeID = $_POST['recipeID'];
	$recipeName = strtoupper($_POST['recipeName']);
	$categoryID = $_POST['categoryID'];
	$remarks = $_POST['remarks'];
	$amount = $_POST['amount'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");


	$checkID = mysql_query("SELECT * FROM mrecipe WHERE recipeID='$recipeID'");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==0){
		$getNewID = mysql_query("SELECT COUNT(recipeID)+1 as count FROM mrecipe");
		$rowNewID = mysql_fetch_array($getNewID);
		$newID = $rowNewID['count'];
		$recUniqID = "REC".str_pad($newID, 4, "0", STR_PAD_LEFT);
		$query = "INSERT INTO mrecipe(recipeID,recipeName,categoryID,remarks,status,dateCreated,lastChanged) VALUES('$recUniqID', '$recipeName', '$categoryID', '$remarks', 1, '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);
		$act = "INSERT_RECIPE_".$recipeName;

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_RECIPE','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);


		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
		$URL="/picaPOS/admin/recipes/recipe_input.php?recipeID=$recUniqID"; 
		echo "<script type='text/javascript'>location.replace('$URL');</script>";
	}else{
		$query = "UPDATE mrecipe SET
				recipeName='$recipeName',
				categoryID='$categoryID',
				remarks='$remarks',
				lastChanged='$lastChanged' 
				WHERE recipeID='$recipeID'
				";
				$res = mysql_query($query);
				
				echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
				$URL="/picaPOS/admin/recipes/recipe_input.php?recipeID=$recipeID"; 
				echo "<script type='text/javascript'>location.replace('$URL');</script>";
	}
	// $res = mysql_query($query);
	
}
?>