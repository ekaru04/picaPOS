<?php
session_start();  
include("../libs/db.php");

$user      = $_SESSION["userID"];
if (isset($_POST['idItem']))
{
    $idItem = $_POST['idItem'];
    $category = $_POST['category'];
    $location = $_POST['location'];
    $measurement = $_POST['measurement'];
    $itemName = $_POST['itemName'];
    $condition = $_POST['condition'];
    $minStock = $_POST['minStock'];
    $dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");
    $journalID = date("YmdHis");
    
    $resIDCheck = mssql_query("SELECT * FROM mStock where idItem = '$idItem'");
    
    if (mssql_num_rows($resIDCheck)==0){
        $idItem = str_pad($idItem, 5, '0', STR_PAD_LEFT);
        $idItem = $location.str_pad($category, 2, '0', STR_PAD_LEFT).str_pad($condition, 2, '0', STR_PAD_LEFT).$idItem;
        
        $activity = "INSERT NEW ITEM".$idItem;
        $query = "INSERT INTO mStock(idItem,itemName,category,measurement,curStock,minStock,location,condition,dateCreated,lastChanged,status) VALUES('$idItem','$itemName','$category','$measurement',0,'$minStock','$location','$condition','$dateCreated','$lastChanged',1)";
        $res = mssql_query($query);
        
        $queryJournal = "INSERT INTO stockJournal(id,activity,menu,users,dateCreated,logCreated,status) 
                            VALUES ('$journalID','$activity','MASTER_ITEM','$_SESSION[userID]','$dateCreated','$lastChanged','SUCCESS')";
        $resJournal = mssql_query($queryJournal);
        
    }else{
        $query = "UPDATE mStock SET
            itemName = '$itemName',
            category = '$category',
            measurement = '$measurement',
            location = '$location',
            condition = '$condition',
            minStock = $minStock,
            lastChanged = '$lastChanged'
            
        WHERE idItem = '$idItem'";
        $res = mssql_query($query);
        
        $activity = "UPDATE ITEM".$idItem;
        $queryJournal = "INSERT INTO stockJournal(id,activity,menu,users,dateCreated,logCreated,status) 
                            VALUES ('$journalID','$activity','MASTER_ITEM','$_SESSION[userID]','$dateCreated','$lastChanged','SUCCESS')";
        $resJournal = mssql_query($queryJournal);
    }
    
    echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
    $URL="/app/wh-item/"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
else{
    echo "<script type='text/javascript'>alert('Data tidak tersimpan!')</script>";
    $URL="/app/wh-item/"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
?>