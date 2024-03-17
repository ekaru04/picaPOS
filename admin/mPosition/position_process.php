<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}include("../../assets/config/db.php");

print_r($_POST['positionID']);
$user      = $_SESSION["userID"];
if (isset($_POST['positionID']))
{
	$positionID = $_POST['positionID'];
	$positionName = strtoupper($_POST['positionName']);
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");


	$checkID = mysql_query("SELECT * FROM mposition WHERE positionID='$positionID'");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==null){
		$getNewID = mysql_query("SELECT COUNT(positionID)+1 as count FROM mposition");
		$rowNewID = mysql_fetch_array($getNewID);
		$newID = $rowNewID['count'];
		$positionUniqID = "PTS".str_pad($newID, 4, "0", STR_PAD_LEFT);
		$query = "INSERT INTO mposition(positionID,positionName,status,dateCreated,lastChanged) VALUES('$positionUniqID', '$positionName',  1, '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
		$act = "INSERT_POSITION_".$positionName;

		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_POSITION','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}else{
		$query = "UPDATE mposition SET
				positionName='$positionName',
				lastChanged='$lastChanged'
				WHERE positionID='$positionID'
				";
				$res = mysql_query($query);

		$journalID = date("YmdHis");
		$actUpd = "UPDATE_POSITION_".$positionName;

		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_POSITION','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);		

		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	$res = mysql_query($query);
	
}
	$URL="/picaPOS/admin/mPosition"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>