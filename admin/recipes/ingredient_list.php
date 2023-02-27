<?php 
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");


    $query = "select i.ingredientID,i.ingredient from mIngredient i where i.status = 1 ORDER BY ingredient";
    $res = mysql_query($query);
    while ($row=mysql_fetch_array($res)){
        $totalPrice = number_format($row[totalProcurementPrice]);
        echo "<option value='$row[ingredientID]'>$row[ingredient]</option>"; 
    }


?>