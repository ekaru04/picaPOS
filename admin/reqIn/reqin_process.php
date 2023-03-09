<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
} 
include("../../assets/config/db.php");

// print_r($_POST['requestID']);
$user      = $_SESSION["userID"];
if (isset($_POST['requestID']))
{
	$requestID = $_POST['requestID'];
	$requestDate = $_POST['requestDate'];
	$categoryID = $_POST['categoryID'];
	$outletID = $_POST['outletID'];
	$productID = $_POST['productID'];
	$amount = $_POST['amount'];
	$measurementID = $_POST['measurementID'];
	$userID = $_POST['username'];
	$remarks = $_POST['remarks'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");

    $per = date("Ym");
	$requestData = mysql_query("SELECT count(requestID)+1 AS countID FROM tabrequestheader");
	$rowRequestData = mysql_fetch_array($requestData);
	$countRequestData = $rowRequestData['countID'];
	$requestID = "PCA/REQ/$per/".str_pad($countRequestData,4,"0",STR_PAD_LEFT); 


	$checkID = mysql_query("SELECT * FROM tabrequestheader WHERE requestID='$requestID'");
	$rowCheck = mysql_fetch_array($checkID);

	// $var = array($requestID, $requestDate, $categoryID, $outletID, $productID, $amount, $measurementID, $userID, $dateCreated, $lastChanged);

	// print_r($var);


	if(mysql_num_rows($checkID)==null){
		$query = "INSERT INTO tabrequestheader (requestID,requestDate,categoryID,outletID,productID,amount,measurementID,userID,status,remarks,dateCreated,lastChanged) VALUES('$requestID', '$requestDate', '$categoryID', '$outletID', '$productID', '$amount', '$measurementID', '$userID', '1', '$remarks',  '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
		$act = "INSERT_REQUESTING_".$requestID;

		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','REQUEST_INGREDIENT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}
		// else{
	// 	$query = "UPDATE mpaymentmethod SET
	// 			methodID='$methodID',
	// 			methodName='$methodName',
	// 			methodType='$methodType',
	// 			remarks='$remarks',
	// 			lastChanged='$lastChanged'
	// 			WHERE methodID='$methodID'
	// 			";
	// 			$res = mysql_query($query);

	// 	echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	// }
	// $res = mysql_query($query);
	
}
	$URL="/picaPOS/admin/reqIn/reqin_details_input.php?requestID=$requestID"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>