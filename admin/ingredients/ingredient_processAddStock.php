<?php
session_start();  
include("../../assets/config/db.php");

print_r($_POST['ingredientID']);
$user      = $_SESSION["userID"];
if (isset($_POST['ingredientID']))
{
	$ingredientID = $_POST['ingredientID'];
	$addStock = $_POST['addStock'];
	$remarks = $_POST['remarks'];
    $lastChanged = date("Y-m-d H:i:s");


	$checkID = mysql_query("SELECT * FROM mingredient WHERE ingredientID='$ingredientID'");
	$rowCheck = mysql_fetch_array($checkID);

	$addingStock = $rowCheck['curStock']+$addStock;

	$query = "UPDATE mingredient SET
				ingredientID='$ingredientID',
				curStock='$addingStock',
				remarks='$remarks',
				lastChanged='$lastChanged'
				WHERE ingredientID='$ingredientID'
				";
				$res = mysql_query($query);

		echo "<script type='text/javascript'>alert('Stock has been Updated!')</script>";
	
	$res = mysql_query($query);
	
}
	$URL="/picaPOS/admin/ingredients"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>