<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");

$user      = $_SESSION["userID"];
if (isset($_GET['userID']))
{
    $userID = $_GET['userID'];
    $dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");
    
    $query = "UPDATE muser SET
                lastChanged = '$lastChanged',
                status = 0            
            WHERE userID = '$userID'";
    $res = mysql_query($query);

    $journalID = date("YmdHis");
        $act = "DELETE_USER_".$userID;

        $queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_user','$user','$dateCreated', '$lastChanged', 'SUCCESS')";
        $resJournal = mysql_query($queryJournal);
    
    echo "<script type='text/javascript'>alert('Data terhapus!')</script>";
    $URL="/picaPOS/admin/mUser"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
else{
    echo "<script type='text/javascript'>alert('Error! Data tidak terhapus!')</script>";
    $URL="/picaPOS/admin/mUser"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
?>