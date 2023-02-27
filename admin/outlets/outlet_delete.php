<?php
session_start();  
include("../../assets/config/db.php");

$user      = $_SESSION["userID"];
if (isset($_GET['outletID']))
{
    $idoutlet = $_GET['outletID'];
    $dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");
    
    $query = "UPDATE moutlet SET
                lastChanged = '$lastChanged',
                status = 0            
            WHERE outletID = '$idoutlet'";
    $res = mysql_query($query);

    $actUpd = "DELETE_OUTLET_".$idoutlet;

    $journalID = date("YmdHis");
        $queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_OUTLET','$user','$dateCreated','$lastChanged', 'SUCCESS')";
        $resJournal = mysql_query($queryJournal);

    echo "<script type='text/javascript'>alert('Data terhapus!')</script>";
    $URL="/picaPOS/admin/outlets/"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
else{
    echo "<script type='text/javascript'>alert('Error! Data tidak terhapus!')</script>";
    $URL="/picaPOS/admin/outlets/"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
?>