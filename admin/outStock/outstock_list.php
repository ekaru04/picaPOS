<?php
    include("../../assets/config/db.php");

    $outletID = $_GET['outletID'];
    $ingredientID = $_GET['ingredientID'];
    $query = "SELECT * FROM mingredient where outletID = '$outletID' AND status = 1 ORDER BY ingredientID";
    $res = mysql_query($query);
    
    echo "<option value = ''>-PLEASE CHOOSE-</option>";
    while($row=mysql_fetch_array($res)){
		if($row[ingredientID]==$ingredientID){
			echo "<option value='$row[ingredientID]' selected>$row[ingredient]</option>";
		}else{
			echo "<option value='$row[ingredientID]'>$row[ingredient]</option>";
		}
        
    }
?>