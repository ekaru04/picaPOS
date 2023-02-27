<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");		
include('../../assets/template/navbar.php');


if($_GET['promoID']==""){
    $queryItemID = "SELECT count(promoID)+1 as promoID FROM mpromo";
    $resItemID = mysql_query($queryItemID);
    $row = mysql_fetch_array($resItemID);
    $promoID = $row['promoID'];
}else{
    $promoID = $_GET['promoID'];
    $query = "SELECT * FROM mpromo WHERE promoID ='$promoID'";
    $res = mysql_query($query);
    $row = mysql_fetch_array($res);

    if($row['isDiscount']==1){
        $isDiscount = "checked";
    }
    if($row['isMonday']==1){
        $isMonday = "checked";
    }
    if($row['isTuesday']==1){
        $isTuesday = "checked";
    }
    if($row['isWednesday']==1){
        $isWednesday = "checked";
    }
    if($row['isThursday']==1){
        $isThursday = "checked";
    }
    if($row['isFriday']==1){
        $isFriday = "checked";
    }
    if($row['isSaturday']==1){
        $isSaturday = "checked";
    }
    if($row['isSunday']==1){
        $isSunday = "checked";
    }

}			
?>
<div>
		<div class='clear height-20 mt-3'></div>
		<div class="container-fluid">
			<div class='entry-box-basic'>
                <h1 class>
                    ADD/EDIT PROMO
<?php 

					if($_GET['promoID']!=""){
echo "<button type='button' id='del' style='border:none;background-color:rgba(255, 255, 255, 0);'>
        <svg xmlns='http://www.w3.org/2000/svg' width='32' height='32' class='bi bi-trash' viewBox='0 0 16 16'>
        <path d='M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z'/>
        <path fill-rule='evenodd' d='M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z'/>
        </svg>
	   </button>";
                    
                } ?>
				</h1>
                <form id='formAdd' method='POST' action='promo_process.php'>
                    <div class='row mt-2 justify-content-center'>
                        <div class='col'>
                            <input type='hidden' class='type-input' name='promoID' value='<?php echo $promoID; ?>'/>
                        </div>
					</div>


                    <div class='row  mt-3 '>
                        <div class='col-2 label'>
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

					<div class='row mt-3 '>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' disabled value='PROMO NAME' />
                        </div>
                        <div class='col-3'>
                            <input type='text' class='form-control' name='promoName' placeholder='Promo Name' style='width:300px' value='<?php echo $row[promoName]; ?>' required />
                        </div>
					</div>

                    <div class='row mt-3 '>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' disabled value='PROMO TYPE' />
                        </div>
                        <div class='col-3'>
                            <input type='text' class='form-control' name='promoType' placeholder='DISCOUNT/PROMO' style='width:300px' value='<?php echo $row[promoType]; ?>' required />
                        </div>
                    </div>

                    <div class='row mt-3 '>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' disabled value='PROMO REQUIREMENT' />
                        </div>
                        <div class='col-3'>
                            <input type='text' class='form-control' name='promoRequirement' placeholder='Min Requirement' style='width:300px' value='<?php echo $row[promoRequirement]; ?>' required />
                        </div>
                    </div>

                    <div class='row'>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' disabled value='PROMO' />
                        </div>
                            <div class="mt-3 col-7">
                             <input type='checkbox' class='type-input day' id='all' name='allDay'>
                             <label for="all">ALL</label>
                             <br>
                            <input type='checkbox' id="monday" class='type-input day' name='isMonday' <?php echo $isMonday; ?> ></input>
                            <label for="monday">MONDAY</label>
                            <input type='checkbox' id="tuesday" class='type-input day' name='isTuesday' <?php echo $isTuesday; ?>></input>
                            <label for="tuesday">TUESDAY</label>
                            <input type='checkbox' id="wednesday" class='type-input day' name='isWednesday' <?php echo $isWednesday; ?>> </input>
                            <label for="wednesday">WEDNESDAY</label>
                            <input type='checkbox' id="thursday" class='type-input day' name='isThursday'  <?php echo $isThursday; ?>> </input>
                            <label for="thursday">THURSDAY</label>
                            <input type='checkbox' id="friday" class='type-input day' name='isFriday' <?php echo $isFriday; ?>> </input>
                            <label for="friday">FRIDAY</label>
                            <input type='checkbox' id="saturday" class='type-input day' name='isSaturday' <?php echo $isSaturday; ?>> </input>
                            <label for="saturday">SATURDAY</label>
                            <input type='checkbox' id="sunday" class='type-input day' name='isSunday' <?php echo $isSunday; ?>>
                            <label for="sunday">SUNDAY</label>
                           </div>
                        </div>

                    <div class='row  mt-3 '>
                        <div class='col-2'>
                            <input type='checkbox' class='type-input' name='isDiscount' <?php echo $isDiscount; ?>> Discount </input>
                        </div>
                        <div class='col-3'>
                            <input type='text' class='type-input form-control' name='discount' id='discount' style='width:60px' value='<?php echo $row[discount]; ?>' required />
                        </div>
                        <div class='col-2' style='margin-left:-270px;'>
                             <label for="discount">%</label>
                        </div>
                    </div>

                    <div class='row  mt-3 '>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' disabled value='START DATE' />
                        </div>
                        <div class='col-3'>
                            <input type='date' class='type-input form-control' name='startDate' placeholder='Promo Requirement' style='width:300px' value='<?php echo $row[startDate]; ?>' required />
                        </div>
                    </div>

                    <div class='row  mt-3 '>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' disabled value='END DATE' />
                        </div>
                        <div class='col-3'>
                            <input type='date' class='type-input form-control' name='endDate' placeholder='Promo Requirement' style='width:300px' value='<?php echo $row[endDate]; ?>' required />
                        </div>
                    </div>

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

    $('#all').click(function() { 
                if ($("#all").is(":checked") == true) { 
                    $('.day').prop('checked', true); 
                } 
                if ($("#all").is(":checked") == false) { 
                    $('.day').prop('checked', false); 
                } 
            }); 
    
    $('#save').click(function() { 
                if ($(":checkbox").is(":checked") == true) { 
                    $(':checkbox').val(1); 
                } else { 
                    $(':checkbox').val(0); 
                } 
            }); 

	$("#cancel").click(function(){
        alert("Data tidak tersimpan");
        location.replace('/picaPOS/admin/promo/');
    });
	
    // $("#del").click(function(){
    //     var r = confirm("Apakah yakin ingin menghapus data ini?");
    //     if(r){
    //         <?php echo "location.replace('method_delete.php?methodID=$methodID');"?>
    //     }
    // });
    
</script>

<script>
  $(window).load(function() { $(".se-pre-con").fadeOut("slow");	});  
</script>
<script src="../../assets/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../../assets/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../assets/dist/js/demo.js"></script>