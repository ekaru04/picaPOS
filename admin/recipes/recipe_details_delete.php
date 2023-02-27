<?php
session_start();  
include("../../assets/config/db.php");

$user      = $_SESSION["userID"];
if (isset($_GET['id']))
{
    $recipeDetails = $_GET['id'];
    $dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");

    $querySel = mysql_query("SELECT * FROM mrecipedetails WHERE id = '$recipeDetails'");
    $row = mysql_fetch_array($querySel);
    $recID = $row['recipeID'];
    
    $query = "UPDATE mrecipedetails SET
                lastChanged = '$lastChanged',
                status = 0            
            WHERE id = '$recipeDetails'";
    $res = mysql_query($query);
    
    echo "<script type='text/javascript'>alert('Data terhapus!')</script>";
    $URL="/picaPOS/admin/recipes/recipe_input.php?recipeID=$recID"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
else{
    echo "<script type='text/javascript'>alert('Error! Data tidak terhapus!')</script>";
    $URL="/picaPOS/admin/recipes/recipe_input.php?recipeID=$recID"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
?>