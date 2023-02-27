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
	
//	$item = $_POST['itemName'];
//	$amount = $_POST['amount'];
	
//	$detailsID = $_POST['detailsID'];
//	$ingredients = implode(',',$_POST['ingredients']);
	// $ingredients = $_POST['ingredients'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");


	$checkID = mysql_query("SELECT * FROM mrecipe WHERE recipeID='$recipeID'");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==0){
		$query = "INSERT INTO mrecipe(recipeID,recipeName,categoryID,remarks,status,dateCreated,lastChanged) VALUES('$recipeID', '$recipeName', '$categoryID', '$remarks', 1, '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);
		$act = "INSERT_RECIPE_".$recipeName;

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_RECIPE','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);
		// foreach($ingredients as $ingredient){}
//
//		$queryDetails = "INSERT INTO mrecipedetails VALUES('$detailsID', '$recipeID', '$ingredients', '$amount', 1, '$dateCreated', '$lastChanged')";
//		$resDetails = mysql_query($queryDetails);


		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}else{
//		$query = "UPDATE mingredient SET
//				recipeID='$recipeID',
//				ingredient='$ingredient',
//				minStock='$minStock',
//				measurementID='$measurementID',
//				remarks='$remarks',
//				lastChanged='$lastChanged'
//				WHERE recipeID='$recipeID'
//				";
//				$res = mysql_query($query);

		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	$res = mysql_query($query);
	
}
	 $URL="/picaPOS/admin/recipes/recipe_input.php?recipeID=$recipeID"; 
     echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>