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
                <form id='formAdd' method='POST' action='reqin_details_process.php'>
                    <div class="row">
                        <div class="col-lg">
                            <div class='row mt-2 justify-content-center'>
                                <div class='col'>
                                    <input type='hidden' class='type-input' name='requestID' value='<?php echo $requestID; ?>'/>
                                </div>
                            </div>
                            <div class='row mt-3 '>
                                <div class='col-2'>
                                    METHOD NAME
                                    <?php
                                        date_default_timezone_set('Asia/Jakarta');
                                        $dateNow = date("Y-m-d");
                                    ?>
                                </div>
                                <div class='col-3'>
                                    <input type='text' class='type-input' name='requestDate' placeholder='...' style='width:300px' value='<?php echo $dateNow; ?>' readonly />
                                </div>
                            </div>
                            <div class='row  mt-3'>
                                <div class='col-2'>
                                CATEGORY
                                </div>
                                 <div class='col-4'>
                                  <?php
                                   $queryCategory="SELECT * FROM mcategory WHERE status != 0";
                                   $resCategory=mysql_query($queryCategory);
                                    while($rowCategory=mysql_fetch_array($resCategory)){
                                     if($rowCategory[categoryID] == $row[categoryID]){
                                      echo "<input type='hidden' class='type-input' name='categoryID' placeholder='...' style='width:300px' value='$rowCategory[categoryID]' readonly/>

                                      <input type='text' class='type-input' placeholder='...' style='width:300px' value=' $rowCategory[categoryName]' readonly/>";
                                      }
                                    }
                                   ?>
                               </div>
                            </div>
                            <div class='row  mt-3 '>
                                <div class='col-2'>
                                    OUTLET
                                </div>
                                <div class='col-4'>
                                 <?php
                                  $queryOutlet="select * from moutlet where status != 0";
                                  $resOutlet=mysql_query($queryOutlet);
                                   while($rowOutlet=mysql_fetch_array($resOutlet)){
                                    if($rowOutlet[outletID] == $row[outletID]){
                                     echo "<input type='hidden' class='type-input' name='outletID' placeholder='...' style='width:300px' value='$rowOutlet[outletID]' readonly/>

                                     <input type='text' class='type-input' placeholder='...' style='width:300px' value=' $rowOutlet[outletName]' readonly/>";
                                    }
                                  }
                                ?>
                                </div>
                            </div>
                            <div class='row  mt-3 '>
                                <div class='col-2'>
                                    PRODUCT
                                </div>
                                <div class='col-4'>
                                 <?php
                                  $queryProduct="select * from mproduct where status != 0";
                                  $resProduct=mysql_query($queryProduct);
                                   while($rowProduct=mysql_fetch_array($resProduct)){
                                    if($rowProduct[productID] == $row[productID]){
                                     echo "<input type='hidden' class='type-input' name='productID' placeholder='...' style='width:300px' value='$rowProduct[productID]' readonly/>

                                            <input type='text' class='type-input' placeholder='...' style='width:300px' value=' $rowProduct[productName]' readonly/>";

                                            }
                                        }
                                    ?>
                                </div>
                            </div>
                            <div class='row mt-3'>
                                <div class='col-2'>
                                    AMOUNT
                                </div>
                                <div class='col-3'>
                                    <input type='number' class='type-input' name='amount' placeholder='Current Stock' style='width:300px' value='<?php echo $row[amount]; ?>' readonly />
                                </div>
                            </div>
                            <div class='row mt-3'>
                                <div class='col-2'>
                                    MEASUREMENT
                                </div>
                                    <?php
                                     $queryMeasurement="select * from mmeasurement where status != 0";
                                     $resMeasurement=mysql_query($queryMeasurement);
                                      while($rowMeasurement=mysql_fetch_array($resMeasurement)){
                                        if($rowMeasurement[measurementID] == $row[measurementID]){
                                         echo "<input type='hidden' class='type-input' name='measurementID' placeholder='...' style='width:300px' value='$rowMeasurement[measurementID]' readonly/>

                                            <input type='text' class='type-input ml-3' placeholder='...' style='width:300px' value=' $rowMeasurement[measurementName]' readonly/>";

                                            }
                                        } 
                                    ?>
                            </div>
                            <div class='row  mt-3 '>
                                <div class='col-2'>
                                    REMARKS
                                </div>
                                <div class='col-3'>
                                    <textarea class='type-input' name='remarks' placeholder='Insert notes here' readonly rows='4' cols='50'><?php echo $row[remarks]; ?></textarea>
                                </div>
                            </div>
                                <div class='col-2'>
                                    INGREDIENT LIST
                                </div>
                            <?php
                            $subQ = "SELECT i.ingredientID, i.ingredient, d.amount, m.measurementName, i.measurementID
                                    FROM mrecipedetails d
                                    INNER JOIN mingredient i ON i.ingredientID = d.ingredientID
                                    INNER JOIN mrecipe r ON r.recipeID = d.recipeID 
                                    INNER JOIN mproduct p ON p.recipeID = r.recipeID
                                    INNER JOIN mmeasurement m ON m.measurementID = i.measurementID
                                    WHERE p.productID = '$row[productID]' ";
                                $detail = mysql_query($subQ);
                                while($rows = mysql_fetch_array($detail)){
                                    $amount = $rows[amount]*$row[amount];

                            ?>
                             <div class='row mt-3 ml-1'>
                                <input type='hidden' class='type-input mr-2' name='ingredientID[]' placeholder='Current Stock'  value='<?php echo $rows[ingredientID] ?>' readonly />
                                    <input type='text' class='type-input mr-2 ' placeholder='Current Stock'  value='<?php echo $rows[ingredient] ?>' readonly />
                                    <input type='number' class='type-input' name='curAmount[]' placeholder='Current Stock' value='<?php echo $amount ?>' readonly />
                                <div class='col-1'>
                                    <?php
                                            $queryMeasurement="select * from mmeasurement where status != 0";
                                            $resMeasurement=mysql_query($queryMeasurement);
                                            while($rowMeasurement=mysql_fetch_array($resMeasurement)){
                                                if($rowMeasurement[measurementID] == $rows[measurementID]){
                                                    echo "<input type='hidden' class='type-input' name='measurementID[]' placeholder='..' value='$rowMeasurement[measurementID]' readonly/>

                                                        <input type='text' class='type-input' name='' placeholder='..' value='$rowMeasurement[measurementName]' readonly/>
                                                    ";
                                                }

                                            } ?>



                                    <!-- <select class='select-cust' name='measurementID[]'>
                                        <option value=''>-CHOOSE ONE-</option>
                                        <?php
                                            $queryMeasurement="select * from mmeasurement where status != 0";
                                            $resMeasurement=mysql_query($queryMeasurement);
                                            while($rowMeasurement=mysql_fetch_array($resMeasurement)){
                                                if($rowMeasurement[measurementID] == $rows[measurementID]){
                                                    echo "<option selected value='$rowMeasurement[measurementID]'>$rowMeasurement[measurementName]</option>";
                                                }else{
                                                    echo "<option value='$rowMeasurement[measurementID]'>$rowMeasurement[measurementName]</option>";
                                                }

                                            } ?> 
                                </select> -->
                                </div>
                            </div>                           
                        <?php
                                }
                            
                        ?>

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
    
</script>

<script>
  $(window).load(function() { $(".se-pre-con").fadeOut("slow");	});  
</script>
<script src="../../assets/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../../assets/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../assets/dist/js/demo.js"></script>