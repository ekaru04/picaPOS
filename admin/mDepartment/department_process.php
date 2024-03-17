<?php
session_start();  
include("../../assets/config/db.php");

print_r($_POST['departmentCode']);
$user      = $_SESSION["userID"];
if (isset($_POST['departmentCode']))
{
	$departmentCode = $_POST['departmentCode'];
	$departmentName = strtoupper($_POST['departmentName']);
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");


	$checkID = mysql_query("SELECT * FROM mdepartment WHERE departmentCode='$departmentCode'");
	$rowCheck = mysql_fetch_array($checkID);

	if(mysql_num_rows($checkID)==0){
		$getNewID = mysql_query("SELECT COUNT(departmentCode)+1 as count FROM mdepartment");
		$rowNewID = mysql_fetch_array($getNewID);
		$newID = $rowNewID['count'];
		$departUniqID = "DRT".str_pad($newID, 4, "0", STR_PAD_LEFT);
		$query = "INSERT INTO mdepartment(departmentCode,departmentName,status,dateCreated,lastChanged) VALUES('$departUniqID', '$departmentName',  1, '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
		$act = "INSERT_DEPARTMENT_".$departmentName;

		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_DEPARTMENT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);


		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}else{
		$query = "UPDATE mdepartment SET
				departmentName='$departmentName',
				lastChanged='$lastChanged'
				WHERE departmentCode='$departmentCode'
				";
				$res = mysql_query($query);

		$journalID = date("YmdHis");
		$actUpd = "UPDATE_DEPARTMENT_".$departmentName;

		$queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_DEPARTMENT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
		$resJournal = mysql_query($queryJournal);


		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	// $res = mysql_query($query);
	
}
	$URL="/picaPOS/admin/mDepartment"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>