<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");
$user      = $_SESSION["userID"];
if(isset($_POST['ingredient'])){
	$recipeID = $_POST['recipeID'];
	$ingredientID = $_POST['ingredient'];
	$amount = $_POST['amount'];
	
	$journalID = date("YmdHis");
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");
	
	$checkID = mysql_query("SELECT * FROM mrecipedetails WHERE recipeID='$recipeID' AND ingredientID = '$ingredientID' AND status = 1");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==0){
		$query = "INSERT INTO mrecipedetails(id,recipeID,ingredientID,amount,status,dateCreated,lastChanged) VALUES ('$journalID','$recipeID','$ingredientID','$amount','1','$dateCreated','$lastChanged')";
		$res = mysql_query($query);

		$act = "INSERT_RECIPE_INGREDIENT_".$ingredientID."($recipeID)";

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','DETAIL_RECIPE','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);
	}else{
		$query = "UPDATE mrecipedetails SET
						ingredientID = '$ingredientID',
						amount = '$amount',
						lastChanged = '$lastChanged'
					WHERE recipeID='$recipeID' AND ingredientID='$ingredientID' AND status = 1";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','UPDATE_RECIPE_INGREDIENT','DETAIL_RECIPE','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);
	}
	// $res = mysql_query($query);
	
	echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	$URL="/picaPOS/admin/recipes/recipe_input.php?recipeID=$recipeID"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
?>