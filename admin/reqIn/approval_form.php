<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");		
include('../../assets/template/navbar.php');

if($_GET['requestID']==""){
    $queryItemID = "SELECT * FROM tabrequestheader";
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
                    MAKE REQUEST PRODUCTION
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
                <form id='formInput' method='POST' action='approval_process.php'>
                    <div class="">
                        <div class="">
                            <div class='row mt-2 justify-content-center'>
                                <div class='col'>
                                    <input type='hidden' class='type-input' name='requestID' value='<?php echo $requestID; ?>'/>
                                    <input type='hidden' class='type-input' name='status' id="status" value='<?php echo $row[status]; ?>'/>
                                </div>
                            </div>
                            <div class="row mt-3">
                            <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' disabled value='REQUEST DATE' />
                            <?php
                                date_default_timezone_set('Asia/Jakarta');
                                $dateNow = date("Y-m-d");
                            ?>
                            </div>
                            <div class='mr-3 col-4'>
                                <input type='text' class='type-input form-control' name='requestDate' placeholder='...' style='width:300px' value='<?php echo $dateNow; ?>' readonly />
                            </div>
                            </div>
                        </div>
                            <div class='row mt-3'>
                            <div class='col-2 label'>
                                <input type='text' class='form-control-plaintext' disabled value='CATEGORY' />
                            </div>
                              <div class='col-4'>
                               <?php
                                $queryCategory="SELECT * FROM mcategory WHERE status != 0";
                                $resCategory=mysql_query($queryCategory);
                                 while($rowCategory=mysql_fetch_array($resCategory)){
                                  if($rowCategory[categoryID] == $row[categoryID]){
                                   echo "<input type='hidden' class='type-input form-control' name='categoryID' placeholder='...' style='width:300px' value='$rowCategory[categoryID]' readonly/>

                                   <input type='text' class='type-input form-control' placeholder='...' style='width:300px' value=' $rowCategory[categoryName]' readonly/>";
                                    }
                                   }
                                  ?>
                               </div>
                            </div>
                            <div class='row  mt-3 '>
                            <div class='col-2 label'>
                                <input type='text' class='form-control-plaintext' disabled value='OUTLET' />
                            </div>
                                <div class='col-4'>
                                 <?php
                                  $queryOutlet="select * from moutlet where status != 0";
                                  $resOutlet=mysql_query($queryOutlet);
                                   while($rowOutlet=mysql_fetch_array($resOutlet)){
                                    if($rowOutlet[outletID] == $row[outletID]){
                                     echo "<input type='hidden' class='type-input form-control' name='outletID' placeholder='...' style='width:300px' value='$rowOutlet[outletID]' readonly/>

                                     <input type='text' class='type-input form-control' placeholder='...' style='width:300px' value=' $rowOutlet[outletName]' readonly/>";
                                    }
                                  }
                                ?>
                                </div>
                            </div>
                            <div class='row  mt-3 '>
                            <div class='col-2 label'>
                                <input type='text' class='form-control-plaintext' disabled value='PRODUCT' />
                            </div>
                                <div class='col-4'>
                                 <?php
                                  $queryProduct="select * from mproduct where status != 0";
                                  $resProduct=mysql_query($queryProduct);
                                   while($rowProduct=mysql_fetch_array($resProduct)){
                                    if($rowProduct[productID] == $row[productID]){
                                     echo "<input type='hidden' class='type-input form-control' name='productID' placeholder='...' style='width:300px' value='$rowProduct[productID]' readonly/>

                                            <input type='text' class='type-input form-control' placeholder='...' style='width:300px' value=' $rowProduct[productName]' readonly/>";

                                            }
                                        }
                                    ?>
                                </div>
                            </div>
                            <div class='row mt-3'>
                            <div class='col-2 label'>
                                <input type='text' class='form-control-plaintext' disabled value='AMOUNT' />
                            </div>
                                <div class='col-3'>
                                    <input type='number' class='type-input form-control' name='amount' placeholder='Current Stock' style='width:300px' value='<?php echo $row[amount]; ?>' readonly />
                                </div>
                            </div>
                            <div class='row mt-3'>
                            <div class='col-2 label'>
                                <input type='text' class='form-control-plaintext' disabled value='MEASUREMENT' />
                            </div>
                                    <?php
                                     $queryMeasurement="select * from mmeasurement where status != 0";
                                     $resMeasurement=mysql_query($queryMeasurement);
                                      while($rowMeasurement=mysql_fetch_array($resMeasurement)){
                                        if($rowMeasurement[measurementID] == $row[measurementID]){
                                         echo "<input type='hidden' class='type-input form-control' name='measurementID' placeholder='...' style='width:300px' value='$rowMeasurement[measurementID]' readonly/>

                                            <input type='text' class='type-input ml-3 form-control' placeholder='...' style='width:300px' value=' $rowMeasurement[measurementName]' readonly/>";

                                            }
                                        } 
                                    ?>
                            </div>
                            <div class='row mt-3'>
                            <div class='col-2 label'>
                                <input type='text' class='form-control-plaintext' disabled value='REMARKS' />
                            </div>
                                <div class='col-3'>
                                    <textarea class='type-input form-control' name='remarks' placeholder='Insert notes here' readonly rows='4' cols='50'><?php echo $row[remarks]; ?></textarea>
                                </div>
                            </div>
                            <div class='row mt-3'>
                            <div class='col-2 label'>
                                <input type='text' class='form-control-plaintext' disabled value='INGREDIENT LIST' />
                            </div>
                            
                            <?php
                            $subQ = "SELECT i.ingredientID, i.ingredient, d.amount, m.measurementName, i.measurementID
                                    FROM mrecipedetails d
                                    INNER JOIN mingredient i ON i.ingredientID = d.ingredientID
                                    INNER JOIN mproduct p ON p.recipeID = d.recipeID
                                    INNER JOIN mmeasurement m ON m.measurementID = i.measurementID
                                    WHERE p.productID = '$row[productID]' ";
                                $detail = mysql_query($subQ);
                                while($rows = mysql_fetch_array($detail)){
                                    $amount = $rows[amount]*$row[amount];

                            ?>
                             <div class='col-2 mt-3 ml-1'>
                                <input type='hidden' class='type-input mr-2' name='ingredientID[]' placeholder='Current Stock'  value='<?php echo $rows[ingredientID] ?>' readonly />
                                    <input type='text' class='type-input mr-2 form-control' placeholder='Current Stock'  value='<?php echo $rows[ingredient] ?>' readonly />
                                    <input type='number' class='type-input form-control' name='curAmount[]' placeholder='Current Stock' value='<?php echo $amount ?>' readonly />

                                    <?php
                                     $queryMeasurement="select * from mmeasurement where status != 0";
                                     $resMeasurement=mysql_query($queryMeasurement);
                                      while($rowMeasurement=mysql_fetch_array($resMeasurement)){
                                        if($rowMeasurement[measurementID] == $rows[measurementID]){
                                         echo "<input type='hidden' class='type-input' name='measurementID[]' placeholder='..' value='$rowMeasurement[measurementID]'/>

                                            <input type='text' class='type-input mr-2 form-control' name='' placeholder='..' value='$rowMeasurement[measurementName]'/>
                                         ";
                                        }
                                      } 
                                    ?>
                            </div>     
                                                  
                        <?php
                                }
                            
                        ?>
                        </div>
                        </div>                  
                    </div>                    
					
                    <div class='row  mt-3 '>
                            <div class='col-2 label'>
                                <input type='text' class='form-control-plaintext' disabled value='REMARKS' />
                            </div>
                                <div class='col-3'>
                                    <textarea class='type-input form-control' name='reason' placeholder='Insert notes here' rows='4' cols='50'></textarea>
                                </div>
                            </div>

					<div class='row mt-3'>
                        <div class="ml-3">
                            <button type='button' id='approve' class='btn btn-success submit' style='margin-right:5px;'>APPROVE</button>
                                <button type='button' id='pending' class='btn btn-warning submit' style='margin-right:5px;'>PENDING</button>
                                <button type='button' id='reject' class='btn btn-danger submit' style='margin-right:5px;'>REJECT</button>
                        </div>
					</div>
             
                        
                </form>
            </div>
		</div>
        </div>
	</body>
</html>
<script type="text/javascript">

	$(document).ready(function(){
		var btn="";
	    $(".submit").click(function () {
	        btn = $(this).attr("id");
	        if(btn=="approve"){
	            var a = confirm("Are you sure to approve this request ?");
	            if(a){
	                $('#status').val('2');
	                $('form#formInput').submit();
	            }
	        }
	        if(btn=="pending"){
	            var p = confirm("Are you sure to pending this request ?");
	            if(p){
	                $('#status').val('1');
	                $('form#formInput').submit();
	            }
	        }  
	        if(btn=="reject"){
	            var r = confirm("Are you sure to reject this request ?");
	            if(r){
	                $('#status').val('69');
	                $('form#formInput').submit();
	            }
	        }   
	        if(btn=="revision"){
	            var rev = confirm("Are you sure to request for revision for this request ?");
	            if(rev){
	                $('#status').val('99');
	                $('form#formInput').submit();
	            }
	        }   
	    });

	});
    
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
    
</script>

<script>
  $(window).load(function() { $(".se-pre-con").fadeOut("slow");	});  
</script>
<script src="../../assets/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../../assets/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../assets/dist/js/demo.js"></script>