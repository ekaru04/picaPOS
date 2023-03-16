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
	}
	else
	{
		echo "Didn't Sent!";
	}

?>