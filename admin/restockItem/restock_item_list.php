<?php
    include("../../assets/config/db.php");

    $outletID = $_GET['outletID'];
    $categoryStockID = $_GET['categoryStockID'];
    $query = "SELECT * FROM mstock where outletID = '$outletID' AND categoryStockID = '$categoryStockID' AND status = 1 ORDER BY stockID";
    $res = mysql_query($query);
    
    echo "<option value = ''>-PLEASE CHOOSE-</option>";
    while($row=mysql_fetch_array($res)){
		if($row[stockID]==$stockID){
			echo "<option value='$row[stockID]' selected>$row[stockName]</option>";
		}else{
			echo "<option value='$row[stockID]'>$row[stockName]</option>";
		}
        
    }
?>