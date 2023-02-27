<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");		
include('../../assets/template/navbar.php');


if($_GET['productID']==""){
    $queryItemID = "SELECT count(productID)+1 as productID FROM mproduct";
    $resItemID = mysql_query($queryItemID);
    $row = mysql_fetch_array($resItemID);
    $productID = $row['productID'];
}else{
    $productID = $_GET['productID'];
    $query = "SELECT * FROM mproduct WHERE productID ='$productID'";
    $res = mysql_query($query);
    $row = mysql_fetch_array($res);
}			
?>
<div>
		<div class='clear height-20 mt-3'></div>
		<div class="container-fluid">
			<div class='entry-box-basic'>
                <h1>
                    <a href='/picaPOS/admin/products' style='text-decoration:none;color:black;'><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
      <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
    </svg>
                        ADD/EDIT PRODUCT
                    </a>
<?php 

					if($_GET['productID']!=""){
echo "<button type='button' id='del' style='border:none;background-color:rgba(255, 255, 255, 0);'>
        <svg xmlns='http://www.w3.org/2000/svg' width='32' height='32' class='bi bi-trash' viewBox='0 0 16 16'>
        <path d='M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z'/>
        <path fill-rule='evenodd' d='M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z'/>
        </svg>
	   </button>";
                    
                } ?>
				</h1>
                <div class="container-fluid">
                    <div class="row">
                <div class="col-8">
                            <form id='formAdd' method='POST' action='product_process.php' enctype="multipart/form-data">
                    <div class='row mt-2'>
                        <div class='col'>
                            <input type='hidden' class='type-input' name='productID' value='<?php echo $productID; ?>'/>
                        </div>
                    </div>

                    <div class='row mt-3'>
                        <div class='col-3 label'>
                            <input type='text' class='form-control-plaintext' disabled value='PRODUCT NAME' />
                        </div>
                        <div class='col-2'>
                            <input type='text' class='type-input form-control' name='productName' placeholder='product Name' style='width:300px' value='<?php echo $row[productName]; ?>' required />
                        </div>
                    </div>

                    <div class='row mt-3'>
                        <div class='col-3 label'>
                            <input type='text' class='form-control-plaintext' disabled value='CATEGORY' />
                        </div>
                        <select class='select-cust ml-3 form-control' name='categoryID' style='width:300px;' required>
                                <option value=''>-CHOOSE ONE-</option>
                                <?php
                                    $queryCategory="select * from mcategory where status != 0";
                                    $resCategory=mysql_query($queryCategory);
                                    while($rowCategory=mysql_fetch_array($resCategory)){
                                        if($rowCategory[categoryID] == $row[categoryID]){
                                            echo "<option selected value='$rowCategory[categoryID]'>$rowCategory[categoryName]</option>";
                                        }else{
                                            echo "<option value='$rowCategory[categoryID]'>$rowCategory[categoryName]</option>";
                                        }

                                    }
                                ?>
                            </select>
                    </div>

                    <div class='row mt-3'>
                        <div class='col-3 label'>
                            <input type='text' class='form-control-plaintext' disabled value='RECIPE' />
                        </div>
                        <select class='select-cust ml-3 form-control' name='recipeID' style='width:300px;' required>
                                <option value=''>-CHOOSE ONE-</option>
                                <?php
                                    $queryRecipe="select * from mrecipe where status != 0";
                                    $resRecipe=mysql_query($queryRecipe);
                                    while($rowRecipe=mysql_fetch_array($resRecipe)){
                                        if($rowRecipe[recipeID] == $row[recipeID]){
                                            echo "<option selected value='$rowRecipe[recipeID]'>$rowRecipe[recipeName]</option>";
                                        }else{
                                            echo "<option value='$rowRecipe[recipeID]'>$rowRecipe[recipeName]</option>";
                                        }

                                    }
                                ?>
                            </select>
                    </div>
                    
                    <?php if($row['curStock']!=0){ ?>
                    
                        
                        <div class='col-3'>
                            
                            <input type='hidden' class='type-input' name='curStock' placeholder='Current Stock' style='width:300px' value='<?php echo $row[curStock]; ?>' required />
                        
                        </div>
                    
                    <?php }else{ ?>
                        <div class='row mt-3'>
                            <div class='col-3 label'>
                            <input type='text' class='form-control-plaintext' disabled value='CURRENT STOCK' />
                        </div>
                            <input type='number' class='type-input ml-3 form-control' name='curStock' placeholder='Current Stock' style='width:300px' value='<?php echo $row[curStock]; ?>' required />
                        </div>
                    <?php } ?>

                    <div class='row mt-3'>
                        <div class='col-3 label'>
                            <input type='text' class='form-control-plaintext' disabled value='MIN STOCK' />
                        </div>
                        <div class='col-3'>
                            <input type='text' class='type-input form-control' name='minStock' placeholder='Minimum Stock' style='width:300px' value='<?php echo round($row[minStock]); ?>' required />
                        </div>
                    </div>

                    <div class='row  mt-3 '>
                        <div class='col-3 label'>
                            <input type='text' class='form-control-plaintext' disabled value='OUTLET' />
                        </div>
                        <div class='col-3'>
                            <select class='select-cust form-control' name='outletID' style='width:300px;' required>
                                <option value=''>-CHOOSE ONE-</option>
                                <?php
                                    $queryOutlet="select * from moutlet where status != 0";
                                    $resOutlet=mysql_query($queryOutlet);
                                    while($rowOutlet=mysql_fetch_array($resOutlet)){
                                        if($rowOutlet[outletID] == $row[outletID]){
                                            echo "<option selected value='$rowOutlet[outletID]'>$rowOutlet[outletName]</option>";
                                        }else{
                                            echo "<option value='$rowOutlet[outletID]'>$rowOutlet[outletName]</option>";
                                        }

                                    }
                                ?>
                            </select>
                        </div>
                    </div>

                    <div class='row mt-3'>
                        <div class='col-3 label'>
                            <input type='text' class='form-control-plaintext' disabled value='MEASUREMENT' />
                        </div>
                        <select class='select-cust ml-3 form-control' name='measurementID' style='width:300px;' required>
                                <option value=''>-CHOOSE ONE-</option>
                                <?php
                                    $queryMeasurement="select * from mmeasurement where status != 0";
                                    $resMeasurement=mysql_query($queryMeasurement);
                                    while($rowMeasurement=mysql_fetch_array($resMeasurement)){
                                        if($rowMeasurement[measurementID] == $row[measurementID]){
                                            echo "<option selected value='$rowMeasurement[measurementID]'>$rowMeasurement[measurementName]</option>";
                                        }else{
                                            echo "<option value='$rowMeasurement[measurementID]'>$rowMeasurement[measurementName]</option>";
                                        }

                                    }
                                ?>
                            </select>
                    </div>

                    <div class='row mt-3'>
                        <div class='col-3 label'>
                            <input type='text' class='form-control-plaintext' disabled value='PRICE' />
                        </div>
                        <div class='col-3'>
                            <input type='text' class='type-input form-control' name='productPrice' placeholder='Price Product' style='width:300px' value='<?php echo round($row[productPrice]); ?>' required />
                        </div>
                    </div>

                    <div class='row mt-3'>
                        <div class='col-3 label'>
                            <input type='text' class='form-control-plaintext' disabled value='UPLOAD PHOTO' />
                        </div>
                        <div class='col-3'>
                            <?php 
                                if($row['productImage']!=null){
                                  echo  "<input type='file' class='type-input' name='fileUpload' style='width:300px' />";
                                  echo $row[productImage];
                                }else{
                                    echo "<input type='file' class='type-input' name='fileUpload' style='width:300px'/>";
                                }
                            ?>
                        </div>
                    </div>

                    <div class='row  mt-3'>
                        <div class='col-3 label'>
                            <input type='text' class='form-control-plaintext' disabled value='REMARKS' />
                        </div>
                        <div class='col-3'>
                            <textarea class='type-input form-control' name='remarks' placeholder='Insert notes here' rows='4'><?php echo $row[remarks]; ?></textarea>
                        </div>
                    </div>
                    
                    <div class='row  mt-3'>
                        <div class='col-3'>
                            <input id='save' type='submit' value='SUBMIT' name='submit' class='btn btn-success' />
                            <button type='button' id='cancel' class='btn btn-danger' >CANCEL</button>  
                        </div>
                    </div>
                    
                </form>
                            
                    </div>
                    <?php
                        if($row['productImage']!=null){
                    ?>
                    <div class="col-4">
                        <div class="card" style="width: 18rem;">
                            <img class="card-img-top" src="<?php echo "../../productImages/".$row[productImage]; ?>">
                            <div class="card-body">
                            <p class="card-text"><?php echo $row[productName]; ?></p>
                            </div>
                        </div>
                    </div>
                    <?php
                        }else{
                    ?>
                    <div class="col-4">

                    </div>
                    <?php } ?> 
                  </div>
                </div>
            </div>
		</div>
        </div>
	</body>
</html>
<script type="text/javascript">
    
	$("#cancel").click(function(){
        alert("Data tidak tersimpan");
        location.replace('/picaPOS/admin/products/');
    });
	
    $("#del").click(function(){
        var r = confirm("Apakah yakin ingin menghapus data ini?");
        if(r){
            <?php echo "location.replace('product_delete.php?productID=$productID');"?>
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