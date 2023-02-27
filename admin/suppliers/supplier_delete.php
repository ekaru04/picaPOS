<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}  
include("../../assets/config/db.php");

$user      = $_SESSION["userID"];
if (isset($_GET['supplierID']))
{
    $idsupplier = $_GET['supplierID'];
    $dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");
    
    $query = "UPDATE msupplier SET
                lastChanged = '$lastChanged',
                status = 0
            
            WHERE supplierID = '$idsupplier'";
    $res = mysql_query($query);

        $journalID = date("YmdHis");
        $queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','DELETE_SUPPLIER','MASTER_SUPPLIER','$user','$dateCreated','$lastChanged', 'SUCCESS')";
        $resJournal = mysql_query($queryJournal);

    echo "<script type='text/javascript'>alert('Data terhapus!')</script>";
    $URL="/picaPOS/admin/suppliers/"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
else{
    echo "<script type='text/javascript'>alert('Error! Data tidak terhapus!')</script>";
    $URL="/picaPOS/admin/suppliers/"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
?>