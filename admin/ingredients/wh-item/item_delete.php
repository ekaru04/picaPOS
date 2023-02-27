<?php
session_start();  
include("../libs/db.php");

$user      = $_SESSION["userID"];
if (isset($_GET['idItem']))
{
    $idItem = $_GET['idItem'];
    $dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");
    $journalID = date("YmdHis");
    
    $query = "UPDATE mStock SET
                lastChanged = '$lastChanged',
                status = 0
            
            WHERE idItem = '$idItem'";
    $res = mssql_query($query);
        
    $queryJournal = "INSERT INTO stockJournal(id,activity,menu,users,dateCreated,logCreated,status) 
                            VALUES ('$journalID','DELETE ITEM','MASTER_ITEM','$_SESSION[userID]','$dateCreated','$lastChanged','SUCCESS')";
    $resJournal = mssql_query($queryJournal);
    
    echo "<script type='text/javascript'>alert('Data terhapus!')</script>";
    $URL="/app/wh-item/"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
else{
    echo "<script type='text/javascript'>alert('Error! Data tidak terhapus!')</script>";
    $URL="/app/wh-item/"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
?>