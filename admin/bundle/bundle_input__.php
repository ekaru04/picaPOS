<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");		
include('../../assets/template/navbar.php');


if($_GET['bundleID']==""){
    $queryItemID = "SELECT count(bundleID)+1 as bundleID FROM tabbundleheader";
    $resItemID = mysql_query($queryItemID);
    $row = mysql_fetch_array($resItemID);
    $bundleID = $row['bundleID'];
}else{
    $bundleID = $_GET['bundleID'];
    $query = "SELECT * FROM tabbundleheader WHERE bundleID ='$bundleID'";
    $res = mysql_query($query);
    $row = mysql_fetch_array($res);
}			
?>
<div class="">
		<div class='clear height-20 mt-3'></div>
		<div class="container-fluid">
			<div class='entry-box-basic'>
                <h1>
					<a href='/picaPOS/admin/bundle' style='text-decoration:none;color:black;'><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
	  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
	</svg>
						ADD/EDIT BUNDLE
					</a>

<?php 

					if($_GET['bundleID']!=""){
echo "<button type='button' id='del' style='border:none;background-color:rgba(255, 255, 255, 0);'>
        <svg xmlns='http://www.w3.org/2000/svg' width='32' height='32' class='bi bi-trash' viewBox='0 0 16 16'>
        <path d='M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z'/>
        <path fill-rule='evenodd' d='M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z'/>
        </svg>
	   </button>";
                    
                } ?>
				</h1>
                <form id='formAdd' method='POST' action='bundle_process.php'>
					<div class='container-fluid'>
						<div class='row mt-2'>
							<div class='col'>
								<input type='hidden' class='type-input' name='bundleID' value='<?php echo $bundleID; ?>'/>
								<input type='hidden' name='itemCount' id='itemCount' value='0' />
							</div>
						</div>

						<div class='row  mt-3 '>
						<div class='col-2 label'>
                           <input type='text' class='form-control-plaintext' disabled value='BUNDLE NAME' />
                        </div>
							<div class='col-4'>
								<input type='text' class='type-input form-control' name='bundleName' placeholder='Bundle Name' style='width:300px' value='<?php echo $row[bundleName]; ?>' required />
							</div>
						</div>

						<div class='row  mt-3'>
						<div class='col-2 label'>
                           <input type='text' class='form-control-plaintext' disabled value='CATEGORY' />
                        </div>
							<div class='col-4'>
								<select class='select-cust form-control' name='categoryID' style='width:300px;' required>
									<option value=''>-CHOOSE ONE-</option>
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

						<div class='row  mt-3'>
						<div class='col-2 label'>
                           <input type='text' class='form-control-plaintext' disabled value='OUTLET'/>
                        </div>
							<div class='col-4'>
								<select class='select-cust form-control' name='outletID' style='width:300px;' required>
									<option value=''>-CHOOSE ONE-</option>
									<?php
										$queryOutlet="SELECT * FROM mOutlet WHERE status != 0";
										$resOutlet=mysql_query($queryOutlet);
										while($rowOutlet=mysql_fetch_array($resOutlet)){
											if($rowOutlet[outletID] == $_SESSION[outletID]){
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
							<div class='col-2 label'>
	                           <input type='text' class='form-control-plaintext' disabled value='BUNDLE PRICE' />
	                        </div>
							<div class='col-4'>
								<input type='text' class='type-input form-control' name='bundlePrice' placeholder='Bundle Price' style='width:300px' value='<?php echo round($row[bundlePrice]); ?>' required />
							</div>
						</div>
						<div class='row  mt-3'>
							<div class='col-3'>
								<input id='save' type='submit' value='SAVE' class='btn btn-success' />
								<button type='button' id='cancel' class='btn btn-danger' >CANCEL</button>  
							</div>
						</div>
					</div>
				</form>
				<br/>

				<div class='container-fluid'>

					<h5>
						PRODUCTS
					</h5>
					<form id='formAddIng' method='POST' action='bundle_product_process.php'>
					
						<table>
							<tr>
								<td>
									<input type='hidden' class='type-input' name='bundleID' value='<?php echo $bundleID; ?>'/>
									<select class='select-cust form-control' name='product' style='width:210px;' >
										<option value=''>-CHOOSE PRODUCTS-</option>
									<?php
										$queryIng="SELECT i.productID,i.productName FROM mproduct i WHERE i.status = 1 ORDER BY productName";
										$resIng=mysql_query($queryIng);
										while($rowI=mysql_fetch_array($resIng)){
											echo "<option value='$rowI[productID]'>$rowI[productName]</option>";
										}
									?>
									</select>
								</td>
								<td>&nbsp;&nbsp;AMOUNT&nbsp;</td>
								<td>
									<input type='text' class='type-input form-control' name='amount' style='width:50px' />
								</td>
								<td>&nbsp;&nbsp;</td>
								<td>
									<button type='button' id='addIngredients' class='btn btn-primary' style='font-size:11px;'>ADD</button>
								</td>
							</tr>
						</table>
					</form>
					<div id='ingredientList'>

					</div>
						<?php
							if($row['bundleID']){
								$detail = mysql_query("SELECT r.id, i.productName, r.amount, r.bundleID FROM tabbundledetail r 
									INNER JOIN mproduct i ON i.productID = r.productID
									INNER JOIN tabbundleheader c ON r.bundleID = c.bundleID WHERE r.status = 1 AND r.bundleID = '$row[bundleID]' ORDER BY id");
								while($rows = mysql_fetch_array($detail)){
									$amount = round($rows[amount]);
	echo"				<div class='row  mt-3 '>
							<div class='col-2'>
								$rows[productName]
							</div>
							<div class='col-2'>
								$amount
							</div>
							<div class='col-2'>
								<a href='bundle_product_delete.php?id=$rows[id]'>DELETE</a>
							</div>
						</div>		
	";							

								}
							}
						?>
<!--
						
						<div id='formItem'>
                       
                    	</div>
-->
						
				</div>
            </div>
		</div>
        </div>
	</body>
</html>
<script type="text/javascript">
//    $(document).ready(function(){  
//        $("#removeItem").click(function(){removeItem();}); 
//        
//    });
    
//    $("#addItem").click(function () {
//        var new_chq_no = parseInt($('#itemCount').val()) + 1;
//        
//        var html = '';
//        
//        html += "<div id='additem"+new_chq_no+"'>";
//        html += "<table><tr><td>";
//        html += "<select class='select-cust item' name='itemName[]' id='item"+new_chq_no+"' style='width:300px;'>";
//        html += "</select> <input type='text' name='amount[]' id='amount"+new_chq_no+"' style='width:50px;'/></td></tr><tr><td>&nbsp;</td></tr></table></div>";
//   
//        $('#formItem').append(html);
//        $('#itemCount').val(new_chq_no);
//    });
//	
//	$(document).on('click','.item',function(){
//        var id = "#"+$(this).attr("id");
//        if($(id).val()==null){
//            $.ajax({
//                url: 'ingredient_list.php',
//                type: 'GET',
//                dataType: 'html',
//                success: function(result){
//                    $(id).html(); 
//                    $(id).html(result); 
//                }
//            });    
//        }
//        
//    });
//    
//    function removeItem(){
//      var itemNum = $('#itemCount').val();
//      if(itemNum>1){
//        $('#additem'+itemNum).remove();
//        $('#itemCount').val(itemNum-1);
//      }
//    };
//	
	
	$('#addIngredients').click(function(){
        var a = confirm("Are you sure to add this ingredient?");
        if(a){
            $('form#formAddIng').submit();
			
        } 
    });

	$("#cancel").click(function(){
        alert("Data tidak tersimpan");
        location.replace('/picaPOS/admin/bundle/');
    });
	
    $("#del").click(function(){
        var r = confirm("Apakah yakin ingin menghapus data ini?");
        if(r){
            <?php echo "location.replace('bundle_delete.php?bundleID=$bundleID');"?>
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