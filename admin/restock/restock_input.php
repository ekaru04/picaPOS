<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");		
include('../../assets/template/navbar.php');

$query = mysql_query("SELECT * FROM muser WHERE username = '$_SESSION[username]'");
$data = mysql_fetch_array($query);


if($_GET['transID']==""){
    $queryItemID = "SELECT count(transID)+1 as transID FROM tabitemtransaction";
    $resItemID = mysql_query($queryItemID);
    $row = mysql_fetch_array($resItemID);
    $transID = $row['transID'];
}else{
    $transID = $_GET['transID'];
    $query = "SELECT * FROM tabitemtransaction WHERE transID ='$transID'";
    $res = mysql_query($query);
    $row = mysql_fetch_array($res);
}			
?>
<div>
		<div class='clear height-20 mt-3'></div>
		<div class="container-fluid">
			<div class='entry-box-basic'>
                <h1 class="text-center">
                    ADD NEW ITEM RESTOCK
<?php 

					if($_GET['transID']!=""){
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
                            <form id='formAdd' method='POST' action='restock_process.php'>
                    <div class='row mt-2'>
                        <div class='col'>
                            <input type='hidden' class='type-input' name='transID' value='<?php echo $transID; ?>'/>
                        </div>
                    </div>

                    <div class='row  mt-3 justify-content-center'>
                        <div class='col-4'>
                            <input type='hidden' class='type-input' name='fullname' placeholder='PIC' style='width:300px' value='<?php echo $data[userID]; ?>' required />
                        </div>
                    </div>

                    <div class='row mt-3'>
                        <div class='col-3 label'>
                            <input type='text' class='form-control-plaintext' disabled value='TRANSACTION DATE' />
                        </div>
                        <?php
                            date_default_timezone_set('Asia/Jakarta');
                            $dateNow = date("Y-m-d");
                        ?>
                        <div class='col-3'>
                            <input type='text' class='type-input form-control' name='transDate' placeholder='Transaction Date' style='width:300px' value='<?php echo $dateNow; ?>' readonly />
                        </div>
                    </div>

                    <div class='row mt-3'>
                        <div class='col-3 label'>
                            <input type='text' class='form-control-plaintext' disabled value='SUPPLIER' />
                        </div>
                        <select class='select-cust ml-3 form-control' name='supplierID' style='width:300px;' required>
                                <option value=''>-CHOOSE ONE-</option>
                                <?php
                                    $querySupplier="select * from msupplier where status != 0";
                                    $resSupplier=mysql_query($querySupplier);
                                    while($rowSupplier=mysql_fetch_array($resSupplier)){
                                        if($rowSupplier[supplierID] == $row[supplierID]){
                                            echo "<option selected value='$rowSupplier[supplierID]'>$rowSupplier[supplierName]</option>";
                                        }else{
                                            echo "<option value='$rowSupplier[supplierID]'>$rowSupplier[supplierName]</option>";
                                        }

                                    }
                                ?>
                            </select>
                    </div>

                    <div class='row  mt-3 '>
                        <div class='col-3 label'>
                           <input type='text' class='form-control-plaintext' disabled value='OUTLET' />
                        </div>
                        <div class='col-3'>
                            <select class='select-cust form-control' name='outletID' id='outletID' style='width:300px;' required>
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

                    <div class='row  mt-3 '>
                        <div class='col-3 label'>
                           <input type='text' class='form-control-plaintext' disabled value='INGREDIENT' />
                        </div>
                        <div class='col-3'>
                            <select class='select-cust form-control' name='ingredientID' id='ingredientID' style='width:300px;' required>
                                <option value=''>-CHOOSE ONE-</option>
                                <?php
                                    $queryIngredient="select * from mingredient where status != 0";
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

                    <div class='row mt-3'>
                        <div class='col-3 label'>
                           <input type='text' class='form-control-plaintext' disabled value='AMOUNT' />
                        </div>
                        <div class='col-3'>
                            <input type='number' class='type-input form-control' name='amount' placeholder='Current Stock' style='width:300px' value='<?php echo $row[amount]; ?>' required />
                        </div>
                    </div>

                    <div class='row mt-3'>
                        <div class='col-3 label'>
                           <input type='text' class='form-control-plaintext' disabled value='MEASUREMENT' />
                        </div>
                        <select class='select-cust ml-3 form-control' name='measurementID' id='measurementID' style='width:300px;' required>
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
                            <input type='number' class='type-input form-control' name='itemPrice' placeholder='Discount' style='width:300px' value='<?php echo $row[itemPrice]; ?>' required />
                        </div>
                    </div>

                    <div class='row mt-3'>
                        <div class='col-3 label'>
                           <input type='text' class='form-control-plaintext' disabled value='DISCOUNT' />
                        </div>
                        <div class='col-3'>
                            <input type='number' class='type-input form-control' name='discount' placeholder='Discount' style='width:300px' value='<?php echo $row[discount]; ?>' />
                        </div>
                    </div>

                    <div class='row  mt-3'>
                        <div class='col-3 label'>
                           <input type='text' class='form-control-plaintext' disabled value='REMARKS' />
                        </div>
                        <div class='col-3'>
                            <textarea class='type-input form-control' name='remarks' placeholder='Insert notes here' rows='4' cols='50'><?php echo $row[remarks]; ?></textarea>
                        </div>
                    </div>
                    
                    <div class='row mt-3'>
                        <div>
                            <input id='save' type='submit' value='SUBMIT' name='submit' class='btn btn-success'/>
                            <button type='button' id='cancel' class='btn btn-danger' >CANCEL</button>  
                        </div>
                    </div>
                    
                </form>
                            
                    </div>
                    
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
        location.replace('/picaPOS/admin/restock/');
    });
	
    $("#del").click(function(){
        var r = confirm("Apakah yakin ingin menghapus data ini?");
        if(r){
            <?php echo "location.replace('restock_delete.php?transID=$transID');"?>
        }
    });

    $(document).on('change','#outletID',function(){
        var val = $('#outletID').val();
        $.ajax({
            url: 'restockIn_list.php',
            data: {outletID:val},
            type: 'GET',
            dataType: 'html',
            success: function(result){
                $('#ingredientID').html(); 
                $('#ingredientID').html(result); 
            }
        });  
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