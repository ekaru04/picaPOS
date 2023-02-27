<?php
session_start();  
include("../../assets/config/db.php");

$user      = $_SESSION["userID"];
if (isset($_GET['methodID']))
{
    $idmethod = $_GET['methodID'];
    $dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");
    
    $query = "UPDATE mpaymentmethod SET
                lastChanged = '$lastChanged',
                status = 0
            
            WHERE methodID = '$idmethod'";
    $res = mysql_query($query);
    
    $journalID = date("YmdHis");
        $act = "DELETE_PAYMENT_".$idmethod;

        $queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_PAYMENT','$user','$dateCreated','$lastChanged', 'SUCCESS')";
        $resJournal = mysql_query($queryJournal);

    echo "<script type='text/javascript'>alert('Data terhapus!')</script>";
    $URL="/picaPOS/admin/payment/"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
else{
    echo "<script type='text/javascript'>alert('Error! Data tidak terhapus!')</script>";
    $URL="/picaPOS/admin/payment/"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
?>