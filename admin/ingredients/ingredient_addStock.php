<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
} 
include("../../assets/config/db.php");		
include("../../assets/template/navbar.php");
?>
<div class="">
		<div class='clear height-20 mt-3'></div>
		<div class="container-fluid">
			<div class='entry-box-basic'>
                <h1 class="text-center">
                    ADD INGREDIENT STOCK
				</h1>
                <form id='formAdd' method='POST' action='ingredient_processAddStock.php'>
					
					<div class='row  mt-3 justify-content-center'>
                        <div class='col-2'>
                            INGREDIENT
                        </div>
                        <div class='col-4'>
                            <select class='select-cust' name='ingredientID' style='width:300px;' required>
								<option value=''>-SELECT INGREDIENT-</option>
								<?php
									$queryIngredient="SELECT * FROM mingredient WHERE status != 0";
									$resIngredient=mysql_query($queryIngredient);
									while($rowIngredient=mysql_fetch_array($resIngredient)){
										if($rowIngredient[ingredientID] == $row[ingredientID]){
											echo "<option selected value='$rowIngredient[ingredientID]'>$rowIngredient[ingredient]</option>";
										}else{
											echo "<option value='$rowIngredient[ingredientID]'>$rowIngredient[ingredient]</option>";
										}

									}
								?>
							</select>
                        </div>
					</div>
					
					<div class='row  mt-3 justify-content-center'>
                        <div class='col-2'>
                            ADD STOCK
                        </div>
                        <div class='col-4'>
                            <input type='text' class='type-input' name='addStock' placeholder='Add Ingredient Stock' style='width:300px' required />
                        </div>
					</div>
					
					<div class='row  mt-3 justify-content-center'>
                        <div class='col-2'>
                            REMARKS
                        </div>
                        <div class='col-4'>
                            <textarea class='type-input' name='remarks' placeholder='Insert notes here' rows='4' cols='50'><?php echo $row[remarks]; ?></textarea>
                        </div>
					</div>
					
					<div class='row  mt-3 justify-content-center'>
                        <div class='col-3'>
                            <input id='save' type='submit' value='SUBMIT' class='btn btn-success' />
							<button type='button' id='cancel' class='btn btn-danger'>CANCEL</button>  
                        </div>
					</div>
             
                        
                </form>
            </div>
		</div>
        </div>
	</body>
</html>
<script type="text/javascript">
    
	$("#cancel").click(function(){
        alert("Data tidak tersimpan");
        location.replace('/picaPOS/ingredients/');
    });
	
    $("#del").click(function(){
        var r = confirm("Apakah yakin ingin menghapus data ini?");
        if(r){
            <?php echo "location.replace('ingredient_delete.php?ingredientID=$ingredientID');"?>
        }
    });
    
</script>

<script>
  $(window).load(function() { $(".se-pre-con").fadeOut("slow");	});  
</script>
<script src="../../assets/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../../assets/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../assets/dist/js/demo.js"></script>