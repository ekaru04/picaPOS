<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");

// print_r($_POST['requestID']);
// $user      = $_SESSION["userID"];
if (isset($_POST['requestID']))
{
	
	$requestID = $_POST['requestID'];
	$ingredientID = $_POST['ingredientID'];
	$curAmount = $_POST['curAmount'];
	$measurementID = $_POST['measurementID'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");


    // print_r($ingredientID);
    // print_r($curAmount);
    // print_r($measurementID);

    $countArr = count($ingredientID);


    if($countArr!=0){

	    for($x = 0;$x<$countArr;$x++){
	    	$ingredient = $ingredientID[$x];
	    	$amount = $curAmount[$x];
	    	$measurement = $measurementID[$x];
	    	$detailID = date('Ymdhis').str_pad($x, 3, "0", STR_PAD_LEFT);

	    	$checkID = mysql_query("SELECT * FROM tabrequestdetail WHERE requestID='$requestID' AND ingredientID='$ingredient'");
			$rowCheck = mysql_fetch_array($checkID);

			if(mysql_num_rows($checkID)==0){
				$query = "INSERT INTO tabrequestdetail(detailID,requestID,ingredientID,amount,measurementID,status,dateCreated,lastChanged) VALUES('$detailID', '$requestID', '$ingredient', '$amount', '$measurement', 1, '$dateCreated', '$lastChanged')";
				$res = mysql_query($query);

				$journalID = date("YmdHis");
				$act = "INSERT_REQUESTING_".$requestID."INGREDIENT($ingredient)";

				$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','REQUEST_DETAIL_INGREDIENT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
				$resJournal = mysql_query($queryJournal);

			}

    	}

    	echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
    }else{
    	echo "<script type='text/javascript'>alert('Data tidak tersimpan!')</script>";
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
	$URL="/picaPOS/admin/reqIn"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>