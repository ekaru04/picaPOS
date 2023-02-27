<?php
    include("../../assets/config/db.php");

    $categoryID = $_GET['categoryStockID'];
    $outletID = $_GET['outletID'];
    $productID = $_GET['stockID'];
    $query = "SELECT * FROM mstock where categoryStockID = '$categoryID' AND outletID = '$outletID' AND status = 1 ORDER BY stockID";
    $res = mysql_query($query);
    
    echo "<option value = ''>-PLEASE CHOOSE-</option>";
    while($row=mysql_fetch_array($res)){
		if($row[stockID]==$productID){
			echo "<option value='$row[stockID]' selected>$row[stockName]</option>";
		}else{
			echo "<option value='$row[stockID]'>$row[stockName]</option>";
		}
        
    }
?>