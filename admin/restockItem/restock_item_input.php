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


if($_GET['transItemID']==""){
    $queryItemID = "SELECT count(transItemID)+1 as transItemID FROM tabstocktransaction";
    $resItemID = mysql_query($queryItemID);
    $row = mysql_fetch_array($resItemID);
    $transItemID = $row['transItemID'];
}else{
    $transItemID = $_GET['transItemID'];
    $query = "SELECT * FROM tabstocktransaction WHERE transItemID ='$transItemID'";
    $res = mysql_query($query);
    $row = mysql_fetch_array($res);
}			
?>
<div>
		<div class='clear height-20 mt-3'></div>
		<div class="container-fluid">
			<div class='entry-box-basic'>
                <h1>
                <a href='/picaPOS/admin/restockItem' style='text-decoration:none;color:black;'><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
      <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
    </svg>
                        ADD NEW ITEM RESTOCK
                    </a>
<?php 

					if($_GET['transItemID']!=""){
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
                <div class="col-12">
                <form id='formAdd' method='POST' action='restock_item_process.php'>
                    <div class="card-body">
                        <div class='row mt-2'>
                            <div class='col'>
                                <input type='hidden' class='type-input' name='transItemID' value='<?php echo $transItemID; ?>'/>
                            </div>
                        </div>
    
                        <div class='row  mt-3 justify-content-center'>
                            <div class='col-4'>
                                <input type='hidden' class='type-input' name='fullname' placeholder='PIC' style='width:300px' value='<?php echo $data[userID]; ?>' required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-4">
                                <h6><b>TRANSACTION DATE</b></h6>
                                <?php
                                    date_default_timezone_set('Asia/Jakarta');
                                    $dateNow = date("Y-m-d");
                                ?>
                                <input type='text' class='form-control' name='transDate' placeholder='Transaction Date' style='width:300px' value='<?php echo $dateNow; ?>' readonly />
                            </div>
                        </div>
                        <hr>

                        <div class='row'>
                            <div class='form-group col-6'>
                                <h6><b>SUPPLIER</b></h6>
                                <select class='select-cust form-control' name='supplierID' required>
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

                            <div class='form-group col-6'>
                                <h6><b>OUTLET</b></h6>
                                <select class='select-cust form-control' name='outletID' id='outletID' required>
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

                        <div class="row">
                            <div class='form-group col-4'>
                                <h6><b>CATEGORY ITEM</b></h6>
                                    <select class='select-cust form-control' name='categoryStockID' id='categoryStockID' required>
                                        <option value=''>-CHOOSE ONE-</option>
                                        <?php
                                            $queryStock="select * from mstockcategory where status != 0";
                                            $resStock=mysql_query($queryStock);
                                            while($rowStock=mysql_fetch_array($resStock)){
                                                if($rowStock[categoryStockID] == $row[categoryStockID]){
                                                    echo "<option selected value='$rowStock[categoryStockID]'>$rowStock[categoryStockName]</option>";
                                                }else{
                                                    echo "<option value='$rowStock[categoryStockID]'>$rowStock[categoryStockName]</option>";
                                                }
        
                                            }
                                        ?>
                                    </select>
                            </div>
                            <div class='form-group col-4'>
                                <h6><b>ITEM NAME</b></h6>
                                    <select class='select-cust form-control' name='stockID' id='stockID' required>
                                        <option value=''>-CHOOSE ONE-</option>
                                        <?php
                                            $queryStock="select * from mstock where status != 0";
                                            $resStock=mysql_query($queryStock);
                                            while($rowStock=mysql_fetch_array($resStock)){
                                                if($rowStock[stockID] == $row[stockID]){
                                                    echo "<option selected value='$rowStock[stockID]'>$rowStock[stockName]</option>";
                                                }else{
                                                    echo "<option value='$rowStock[stockID]'>$rowStock[stockName]</option>";
                                                }
        
                                            }
                                        ?>
                                    </select>
                            </div>
                            <!-- <div class="form-group col-sm-2">
                                <h6><b>Qty</b></h6>
                                <input type="text" class="form-control" name="qty" required>
                            </div>
                            <div class='form-group col-sm-2'>
                                <h6><b>Measurement =></b></h6>
                                <select class='select-cust form-control' name='eXmeasurementID' id='eXmeasurementID' required>
                                        <option value=''>-</option>
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
                            </div> -->
                            <div class="form-group col-sm-2">
                                <h6><b>Amount</b></h6>
                                <input type="text" class="form-control" name="amount" required value='<?php echo $row[amount]; ?>'>
                            </div>
                            <div class='form-group col-sm-2'>
                                <h6><b>Conv. Measurement</b></h6>
                                <select class='select-cust form-control' name='measurementID' id='measurementID' required>
                                        <option value=''>-</option>
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
                        </div>
                        <div class='row'>
                            <div class="form-group col-sm-2">
                                <h6><b>Total Price</b></h6>
                                <input type="text" class="form-control" name="totalPrice" value='<?php echo $row[totalPrice]; ?>' required>
                            </div>
                            <div class="form-group col-sm-2">
                                <h6><b>Discount (%)</b></h6>
                                <input type="text" class="form-control" name="discount" value='<?php echo $row[discount]; ?>' required>
                            </div>
                            <div class="form-group">
                                <h6 class='ml-3'><b>REMARKS</b></h6>
                                <div class='form-group col-6'>
                                    <textarea class='type-input form-control' name='remarks' placeholder='Insert notes here' rows='4' cols='150'><?php echo $row[remarks]; ?></textarea>
                                </div>
                            </div>
                        </div>
                        
                    </div>




                    <!-- <div class='row mt-3'>
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
                    </div> -->

                    
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
            <?php echo "location.replace('restock_delete.php?transItemID=$transItemID');"?>
        }
    });

    $(document).on('change','#categoryStockID',function(){
        var val = $('#categoryStockID').val();
        var val2 = $('#outletID').val();
        $.ajax({
            url: 'restock_item_list.php',
            data: {categoryStockID:val,outletID:val2},
            type: 'GET',
            dataType: 'html',
            success: function(result){
                $('#stockID').html(); 
                $('#stockID').html(result); 
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