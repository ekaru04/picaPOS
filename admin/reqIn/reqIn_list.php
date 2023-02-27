<?php
    include("../../assets/config/db.php");

    $categoryID = $_GET['categoryID'];
    $outletID = $_GET['outletID'];
    $query = "SELECT * FROM mproduct where categoryID = '$categoryID' AND outletID = '$outletID' AND status = 1 ORDER BY productID";
    $res = mysql_query($query);
    
    echo "<option value = ''>-PLEASE CHOOSE-</option>";
    while($row=mysql_fetch_array($res)){
        echo "<option value='$row[productID]'>$row[productName]</option>";
    }
?>