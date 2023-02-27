<?php
session_start();  
include("../../assets/config/db.php");

$user      = $_SESSION["userID"];
if (isset($_GET['voucherCode']))
{
    $voucherCode = $_GET['voucherCode'];
    $dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");
    
    $query = "UPDATE mvoucher SET
                lastChanged = '$lastChanged',
                status = 0            
            WHERE voucherCode = '$voucherCode'";
    $res = mysql_query($query);

    $journalID = date("YmdHis");
        $act = "DELETE_VOUCHER_".$voucherCode;

        $queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_VOUCHER','$user','$dateCreated', '$lastChanged', 'SUCCESS')";
        $resJournal = mysql_query($queryJournal);
    
    echo "<script type='text/javascript'>alert('Data terhapus!')</script>";
    $URL="/picaPOS/admin/activeVouchers/"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
else{
    echo "<script type='text/javascript'>alert('Error! Data tidak terhapus!')</script>";
    $URL="/picaPOS/admin/activeVouchers/"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
?>