<?php
session_start();  
include("../../assets/config/db.php");

$user      = $_SESSION["userID"];
if (isset($_GET['measurementID']))
{
    $measurementID = $_GET['measurementID'];
    $dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");
    
    $query = "UPDATE mmeasurement SET
                lastChanged = '$lastChanged',
                status = 0
            
            WHERE measurementID = '$measurementID'";
    $res = mysql_query($query);

        $journalID = date("YmdHis");
        $queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','DELETE_MEASUREMENT','MASTER_MEASUREMENT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
        $resJournal = mysql_query($queryJournal);
    
    echo "<script type='text/javascript'>alert('Data terhapus!')</script>";
    $URL="/picaPOS/admin/measurements/"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
else{
    echo "<script type='text/javascript'>alert('Error! Data tidak terhapus!')</script>";
    $URL="/picaPOS/admin/measurements/"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
?>