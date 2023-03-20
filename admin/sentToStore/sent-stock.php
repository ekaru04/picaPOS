<?php
include("../../assets/config/db.php");		
include('../../assets/template/navbar.php');

session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
$query = mysql_query("SELECT * FROM muser WHERE username = '$_SESSION[username]'");
$data = mysql_fetch_array($query);

if($_GET['requestID']==""){
    $queryItemID = "SELECT count(requestID)+1 as requestID FROM tabrequestheader";
    $resItemID = mysql_query($queryItemID);
    $row = mysql_fetch_array($resItemID);
    $requestID = $row['requestID'];
}else{
    $requestID = $_GET['requestID'];
    $query = "SELECT * FROM tabrequestheader WHERE requestID ='$requestID'";
    $res = mysql_query($query);
    $row = mysql_fetch_array($res);
}			
?>
<div>
		<div class='clear height-20 mt-3'></div>
		<div class="container-fluid">
			<div class='entry-box-basic'>
                <h1 class>
                    MAKE REQUEST PRODUCT
<?php 

					if($_GET['requestID']!=""){
echo "<button type='button' id='del' style='border:none;background-color:rgba(255, 255, 255, 0);'>
        <svg xmlns='http://www.w3.org/2000/svg' width='32' height='32' class='bi bi-trash' viewBox='0 0 16 16'>
        <path d='M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z'/>
        <path fill-rule='evenodd' d='M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z'/>
        </svg>
	   </button>";
                    
                } ?>
				</h1>
                <form id='formAdd' method='POST' action='reqin_process.php'>
                    <div class='row mt-2 justify-content-center'>
                        <div class='col'>
                            <input type='hidden' class='type-input' name='requestID' value='<?php echo $requestID; ?>'/>
                        </div>
                        <div class='col'>
                            <input type='hidden' class='type-input' name='username' value='<?php echo $data[userID]; ?>'/>
                        </div>
					</div>

					<div class='row mt-3 '>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' disabled value='REQUEST DATE' />
                            <?php
                                date_default_timezone_set('Asia/Jakarta');
                                $dateNow = date("Y-m-d");
                            ?>
                        </div>
                        <div class='col-3'>
                            <input type='text' class='type-input form-control' name='requestDate' placeholder='...' style='width:300px' value='<?php echo $dateNow; ?>' readonly />
                        </div>
					</div>

                    <div class='row  mt-3 '>
                        <div class='col-2 label'>
                         <input type='text' class='form-control-plaintext' disabled value='OUTLET' />
                        </div>
                        <div class='col-4'>
                            <select class='select-cust form-control' name='outletID' id='outletID' style='width:300px;' required>
                                <option value=''>-SELECT OUTLET-</option>
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

                    <div class='row  mt-3'>
                        <div class='col-2 label'>
                         <input type='text' class='form-control-plaintext' disabled value='CATEGORY' />
                        </div>
                            <div class='col-4'>
                                <select class='select-cust form-control' name='categoryID' id='categoryID' style='width:300px;' required>
                                    <option value=''>-SELECT CATEGORY-</option>
                                    <?php
                                        $queryCategory="SELECT * FROM mcategory WHERE status != 0";
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
                    </div>

                    <div class='row  mt-3 '>
                        <div class='col-2 label'>
                         <input type='text' class='form-control-plaintext' disabled value='PRODUCT' />
                        </div>
                        <div class='col-4'>
                            <select class='select-cust form-control' name='productID' id='productID' style='width:300px;' required>
                                <option value=''>-SELECT PRODUCT-</option>
                                <?php
                                    $queryProduct="select * from mproduct where status != 0";
                                    $resProduct=mysql_query($queryProduct);
                                    while($rowProduct=mysql_fetch_array($resProduct)){
                                        if($rowProduct[productID] == $row[productID]){
                                            echo "<option selected value='$rowProduct[productID]'>$rowProduct[productName]</option>";
                                        }else{
                                            echo "<option value='$rowProduct[productID]'>$rowProduct[productName]</option>";
                                        }

                                    }
                                ?>
                            </select>
                        </div>
                    </div>

                    <div class='row mt-3'>
                        <div class='col-2 label'>
                         <input type='text' class='form-control-plaintext' disabled value='AMOUNT' />
                        </div>
                        <div class='col-3'>
                            <input type='number' class='type-input form-control' name='amount' placeholder='Current Stock' style='width:300px' value='<?php echo $row[amount]; ?>' required />
                        </div>
                    </div>

                    <div class='row mt-3'>
                        <div class='col-2 label'>
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

                                    } ?> </select> </div>

                    <div class='row  mt-3 '>
                        <div class='col-2 label'>
                         <input type='text' class='form-control-plaintext' disabled value='REMARKS' />
                        </div>
                        <div class='col-3'>
                            <textarea class='type-input form-control' name='remarks' placeholder='Insert notes here' rows='4' cols='50'><?php echo $row[remarks]; ?></textarea>
                        </div>
                    </div>
					
					<div class='row  mt-3 '>
                        <div class='col-3'>
                            <input id='save' type='submit' value='SUBMIT' class='btn btn-success' />
							<button type='button' id='cancel' class='btn btn-danger' >CANCEL</button>  
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
        location.replace('/picaPOS/admin/payment/');
    });
	
    $("#del").click(function(){
        var r = confirm("Apakah yakin ingin menghapus data ini?");
        if(r){
            <?php echo "location.replace('method_delete.php?methodID=$methodID');"?>
        }
    });

    $(document).on('change','#categoryID',function(){
        var val = $('#categoryID').val();
        var val2 = $('#outletID').val();
        $.ajax({
            url: 'reqIn_list.php',
            data: {categoryID:val,outletID:val2},
            type: 'GET',
            dataType: 'html',
            success: function(result){
                $('#productID').html(); 
                $('#productID').html(result); 
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