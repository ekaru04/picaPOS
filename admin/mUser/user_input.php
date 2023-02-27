<?php

session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}

include("../../assets/config/db.php");		
include('../../assets/template/navbar.php');
date_default_timezone_set('Asia/Jakarta');
$date = date("ymd");

if($_GET['userID']==""){
    $queryItemID = "SELECT count(userID)+1 as userID FROM muser";
    $resItemID = mysql_query($queryItemID);
    $row = mysql_fetch_array($resItemID);
    $userID = $row['userID'];
	$req = "required";
}else{
    $userID = $_GET['userID'];
    $query = "SELECT * FROM muser WHERE userID ='$userID'";
    $res = mysql_query($query);
    $row = mysql_fetch_array($res);
	$req = "";
	
	if($row['status']==1){
		$activeFlag="checked";
	}
	
	$ress = mysql_query("SELECT * FROM tabUserMenu WHERE userID = '$userID' order by menuID");
	while($rowItem=mysql_fetch_array($ress)){
		switch($rowItem['menuID']){
			case "A001":
				$ops1 = "checked";
				break;
			case "A002":
				$ops2 = "checked";
				break;
			case "A003":
				$ops3 = "checked";
				break;
			case "B001":
				$trx1 = "checked";
				break;
			case "B002":
				$trx2 = "checked";
				break;
			case "B003":
				$trx3 = "checked";
				break;
			case "B004":
				$trx4 = "checked";
				break;
			case "C001":
				$mas1 = "checked";
				break;
			case "C002":
				$mas2 = "checked";
				break;
			case "C003":
				$mas3 = "checked";
				break;
			case "C004":
				$mas4 = "checked";
				break;
			case "C005":
				$mas5 = "checked";
				break;
			case "C006":
				$mas6 = "checked";
				break;
			case "D001":
				$stk1 = "checked";
				break;
			case "D002":
				$stk2 = "checked";
				break;
			case "D003":
				$stk3 = "checked";
				break;
			case "E001":
				$rpt1 = "checked";
				break;
			case "E002":
				$rpt2 = "checked";
				break;
			case "E003":
				$rpt3 = "checked";
				break;
			case "F001":
				$mgt1 = "checked";
				break;
			case "F002":
				$mgt2 = "checked";
				break;
			case "F003":
				$mgt3 = "checked";
				break;
			case "F004":
				$mgt4 = "checked";
				break;
		}
	}
}			
?>
<div>
		<div class='clear height-20 mt-3'></div>
		<div class="container-fluid">
			<div class='entry-box-basic'>
                <h1>
                    <a href='/picaPOS/admin/mUser' style='text-decoration:none;color:black;'><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
      <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
    </svg>
                        ADD/EDIT USER
                    </a>
<?php 

					if($_GET['userID']!=""){
echo "<button type='button' id='del' style='border:none;background-color:rgba(255, 255, 255, 0);'>
        <svg xmlns='http://www.w3.org/2000/svg' width='32' height='32' class='bi bi-trash' viewBox='0 0 16 16'>
        <path d='M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z'/>
        <path fill-rule='evenodd' d='M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z'/>
        </svg>
	   </button>";
                    
                } ?>
				</h1>
				<br/>
				<h3> USER INFORMATION </h3>
                <form id='formAdd' method='POST' action='user_process.php'>
                    <div class='row mt-1'>
                        <div class='col'>
                            <input type='text' class='type-input' name='userID' id='userID' value='<?php echo $userID; ?>'/>
                        </div>
					</div>

                    <div class='row  mt-1'>
                        <div class='col-2 label'>
                           <input type='text' class='form-control-plaintext' disabled value='EMPLOYEE NO' />
                        </div>
                        <div class='col-4'>
                            <input type='text' class='type-input form-control' name='employeeNo' placeholder='Employee No' style='width:300px' value='<?php echo $row[employeeNo]; ?>' required />
                        </div>
                    </div>
					
					<div class='row  mt-1'>
                        <div class='col-2 label'>
                           <input type='text' class='form-control-plaintext' disabled value='USERNAME' />
                        </div>
                        <div class='col-4'>
                            <input type='text' class='type-input form-control' name='username' placeholder='Username' style='width:300px' value='<?php echo $row[username]; ?>' required />
                        </div>
					</div>
					
					<div class='row  mt-1'>
                        <div class='col-2 label'>
                           <input type='text' class='form-control-plaintext' disabled value='PASSWORD' />
                        </div>
                        <div class='col-4'>
                            <input type='password' class='type-input form-control' name='password' placeholder='Input if new/want to change password'style='width:300px' value='' <?php echo $req;?> minlength='6' />
                        </div>
					</div>
					
                    <div class='row  mt-1'>
                        <div class='col-2 label'>
                           <input type='text' class='form-control-plaintext' disabled value='FULLNAME' />
                        </div>
                        <div class='col-4'>
                            <input type='text' class='type-input form-control' name='fullname' placeholder='Fullname' style='width:300px' value='<?php echo $row[fullname]; ?>' required />
                        </div>
                    </div>

					<div class='row  mt-1'>
                        <div class='col-2 label'>
                           <input type='text' class='form-control-plaintext' disabled value='DEPARTMENT' />
                        </div>
                        <div class='col-4'>
                            <select class='select-cust form-control' name='departmentCode' style='width:300px;' required>
								<option value=''>-CHOOSE ONE-</option>
								<?php
                                    $queryDepartment="select * from mdepartment where status != 0";
                                    $resDepartment=mysql_query($queryDepartment);
                                    while($rowDepartment=mysql_fetch_array($resDepartment)){
                                        if($rowDepartment[departmentCode] == $row[departmentCode]){
                                            echo "<option selected value='$rowDepartment[departmentCode]'>$rowDepartment[departmentName]</option>";
                                        }else{
                                            echo "<option value='$rowDepartment[departmentCode]'>$rowDepartment[departmentName]</option>";
                                        }

                                    }
                                ?>
							</select>
                        </div>
					</div>

                    <div class='row  mt-1 '>
                        <div class='col-2 label'>
                           <input type='text' class='form-control-plaintext' disabled value='OUTLET' />
                        </div>
                        <div class='col-4'>
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

                    <div class='row  mt-1 '>
                        <div class='col-2 label'>
                           <input type='text' class='form-control-plaintext' disabled value='POSITION' />
                        </div>
                        <div class='col-4'>
                            <select class='select-cust form-control' name='positionID' style='width:300px;' required>
                                <option value=''>-CHOOSE ONE-</option>
                                <?php
                                    $queryPosition="select * from mposition where status != 0";
                                    $resPosition=mysql_query($queryPosition);
                                    while($rowPosition=mysql_fetch_array($resPosition)){
                                        if($rowPosition[positionID] == $row[positionID]){
                                            echo "<option selected value='$rowPosition[positionID]'>$rowPosition[positionName]</option>";
                                        }else{
                                            echo "<option value='$rowPosition[positionID]'>$rowPosition[positionName]</option>";
                                        }

                                    }
                                ?>
                            </select>
                        </div>
                        <div class='col' style='margin-left:-120px;'>
							<input type='checkbox' class='type-input' id='activeFlag' <?php echo $activeFlag; ?> name='activeFlag'/>
							<label for='activeFlag'>Is Active</label>
                        </div>
                    </div>
					<br/>
					<div>
						<h3> PERMISSION </h3>
						<div class='row  mt-3'>
							<div class='col-4'>
								<input type='checkbox' class='type-input' id='allCheck' name='allCheck'/>
								<label for='allCheck'> ALL PERMISSION</label>
							</div>
						</div>
						<div class='row mt-3'>
							<div class='col-3'>
                            	<h5>OPERATIONAL</h5>
                            	<input type='checkbox' class='type-input ch ops' <?php echo $ops1; ?> name='ops1' id='ops1'/>
								<label for='ops1' style='font-weight:normal;'>POS</label><br/>
								
                            	<input type='checkbox' class='type-input ch ops' <?php echo $ops2; ?> name='ops2' id='ops2'/>
								<label for='ops2' style='font-weight:normal;'>Order List</label><br/>
								
                            	<input type='checkbox' class='type-input ch ops' <?php echo $ops3; ?> name='ops3' id='ops3'/>
								<label for='ops3' style='font-weight:normal;'>Close Cashier</label><br/>
								
                            	<input type='checkbox' class='type-input ch' id='allOps' name='allOps'/>
								<label for='allOps' style='font-weight:normal;'>All Operational Menu</label><br/>
							</div>
							<div class='col-3'>
                            	<h5>TRANSACTION</h5>
                            	<input type='checkbox' class='type-input ch trx' <?php echo $trx1; ?> name='trx1' id='trx1'/>
								<label for='trx1' style='font-weight:normal;'>Restock Ingredient</label><br/>
								
                            	<input type='checkbox' class='type-input ch trx' <?php echo $trx2; ?> name='trx2' id='trx2'/>
								<label for='trx2' style='font-weight:normal;'>Production Input</label><br/>
								
                            	<input type='checkbox' class='type-input ch trx' <?php echo $trx3; ?> name='trx3' id='trx3'/>
								<label for='trx3' style='font-weight:normal;'>In/Out Products</label><br/>

                            	<input type='checkbox' class='type-input ch trx' <?php echo $trx4; ?> name='trx4' id='trx4'/>
								<label for='trx4' style='font-weight:normal;'>Pengeluaran</label><br/>
								
                            	<input type='checkbox' class='type-input ch' id='allTrx' name='allTrx'/>
								<label for='allTrx' style='font-weight:normal;'>All Transaction Menu</label><br/>
							</div>
							<div class='col-3'>
                            	<h5>MASTER DATA</h5>
                            	<input type='checkbox' class='type-input ch mas' <?php echo $mas1; ?> name='mas1' id='mas1'/>
								<label for='mas1' style='font-weight:normal;'>Categories</label><br/>
								
                            	<input type='checkbox' class='type-input ch mas' <?php echo $mas2; ?> name='mas2' id='mas2'/>
								<label for='mas2' style='font-weight:normal;'>Measurement</label><br/>
								
                            	<input type='checkbox' class='type-input ch mas' <?php echo $mas3; ?> name='mas3' id='mas3'/>
								<label for='mas3' style='font-weight:normal;'>Payment Method</label><br/>
								
                            	<input type='checkbox' class='type-input ch mas' <?php echo $mas4; ?> name='mas4' id='mas4'/>
								<label for='mas4' style='font-weight:normal;'>Supplier</label><br/>
								
                            	<input type='checkbox' class='type-input ch mas' <?php echo $mas5; ?> name='mas5' id='mas5'/>
								<label for='mas5' style='font-weight:normal;'>Promo</label><br/>
								
                            	<input type='checkbox' class='type-input ch mas' <?php echo $mas6; ?> name='mas6' id='mas6'/>
								<label for='mas6' style='font-weight:normal;'>Vouchers</label><br/>
								
                            	<input type='checkbox' class='type-input ch' id='allMas' name='allMas'/>
								<label for='allMas' style='font-weight:normal;'>All Master Data Menu</label><br/>
							</div>
						</div>
						<div class='row mt-3'>
							<div class='col-3'>
                            	<h5>STOCK</h5>
                            	<input type='checkbox' class='type-input ch stk' <?php echo $stk1; ?> name='stk1' id='stk1'/>
								<label for='stk1' style='font-weight:normal;'>Ingredients</label><br/>
								
                            	<input type='checkbox' class='type-input ch stk' <?php echo $stk2; ?> name='stk2' id='stk2'/>
								<label for='stk2' style='font-weight:normal;'>Recipes</label><br/>
								
                            	<input type='checkbox' class='type-input ch stk' <?php echo $stk3; ?> name='stk3' id='stk3'/>
								<label for='stk3' style='font-weight:normal;'>Products</label><br/>
								
                            	<input type='checkbox' class='type-input ch' id='allStk' name='allStk'/>
								<label for='allStk' style='font-weight:normal;'>All Stock Menu</label><br/>
							</div>
							<div class='col-3'>
                            	<h5>REPORTS</h5>
                            	<input type='checkbox' class='type-input ch rpt' <?php echo $rpt1; ?> name='rpt1' id='rpt1'/>
								<label for='rpt1' style='font-weight:normal;'>Sales</label><br/>
								
                            	<input type='checkbox' class='type-input ch rpt' <?php echo $rpt2; ?> name='rpt2' id='rpt2'/>
								<label for='rpt2' style='font-weight:normal;'>Production</label><br/>

                            	<input type='checkbox' class='type-input ch rpt' <?php echo $rpt3; ?> name='rpt3' id='rpt3'/>
								<label for='rpt3' style='font-weight:normal;'>Transaction POS</label><br/>
								
                            	<input type='checkbox' class='type-input ch' id='allRpt' name='allRpt'/>
								<label for='allRpt' style='font-weight:normal;'>All Report Menu</label><br/>
							</div>
							<div class='col-3'>
                            	<h5>MANAGEMENT</h5>
                            	<input type='checkbox' class='type-input ch mgt' <?php echo $mgt1; ?> name='mgt1' id='mgt1'/>
								<label for='mgt1' style='font-weight:normal;'>Outlet</label><br/>
								
                            	<input type='checkbox' class='type-input ch mgt' <?php echo $mgt2; ?> name='mgt2' id='mgt2'/>
								<label for='mgt2' style='font-weight:normal;'>User</label><br/>
								
                            	<input type='checkbox' class='type-input ch mgt' <?php echo $mgt3; ?> name='mgt3' id='mgt3'/>
								<label for='mgt3' style='font-weight:normal;'>Departement</label><br/>
								
                            	<input type='checkbox' class='type-input ch mgt' <?php echo $mgt4; ?> name='mgt4' id='mgt4'/>
								<label for='mgt4' style='font-weight:normal;'>Position</label><br/>
								
                            	<input type='checkbox' class='type-input ch' id='allMgt' name='allMgt'/>
								<label for='allMgt' style='font-weight:normal;'>All Management Menu</label><br/>
							</div>
						</div>
						<div class='row mt-3'>
							<div class='col-3'>
                            	<h5>GUEST</h5>
                            	<input type='checkbox' class='type-input ch gst' <?php echo $gst1; ?> name='gst1' id='gst'/>
								<label for='gst1' style='font-weight:normal;'>GUEST</label><br/>
							</div>
						</div>
					</div>
					<div class='row  mt-3'>
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
	
	$(document).ready(function(){  
		if ($(".ops:checked").length == $('.ops').length) { 
					$('#allOps').prop('checked', true); 
		}   
		if ($(".trx:checked").length == $('.trx').length) { 
					$('#allTrx').prop('checked', true); 
		}   
		if ($(".mas:checked").length == $('.mas').length) { 
					$('#allMas').prop('checked', true); 
		}   
		if ($(".stk:checked").length == $('.stk').length) { 
					$('#allStk').prop('checked', true); 
		}   
		if ($(".rpt:checked").length == $('.rpt').length) { 
					$('#allRpt').prop('checked', true); 
		}   
		if ($(".mgt:checked").length == $('.mgt').length) { 
					$('#allMgt').prop('checked', true); 
		} 	
		if ($(".ch:checked").length == $('.ch').length) { 
				$('#allCheck').prop('checked', true); 
		} 	
		if ($(".gst:checked").length == $('.gst').length) { 
				$('#gst').prop('checked', true); 
		}  
    }); 
	
    $('#activeFlag').click(function() { 
                if ($("#activeFlag").is(":checked") == false) { 
                    $(':checkbox').prop('checked', false); 
                    $('.hp').val(Math.random().toString(36).substr(2, 13));
                } 
            }); 
	$('#allCheck').click(function() { 
                if ($("#allCheck").is(":checked") == true) { 
                    $('.ch').prop('checked', true); 
                } 
            }); 
    $('#activeFlag').click(function() { 
                if ($("#activeFlag").is(":checked") == false) { 
                    $(':checkbox').prop('checked', false); 
                } 
            }); 
	
    $('#allOps').click(function() { 
                if ($("#allOps").is(":checked") == true) { 
                    $('.ops').prop('checked', true); 
					if ($(".ch").not(':checked').length == 0){
                    	$('#allCheck').prop('checked', true); 
					}else{
						$('#allCheck').prop('checked', false); 
					}
                } 
    }); 
    $('.ops').click(function() { 
                if ($(".ops input:checkbox:checked").length == 0) { 
                    $('#allOps').prop('checked', false); 
                    $('#allCheck').prop('checked', false); 
                }
                if ($(".ops").not(':checked').length == 0) { 
                    $('#allOps').prop('checked', true); 
					if ($(".ch").not(':checked').length == 0){
                    	$('#allCheck').prop('checked', true); 
					}else{
						$('#allCheck').prop('checked', false); 
					}
                }
    }); 
	
    $('#allTrx').click(function() { 
                if ($("#allTrx").is(":checked") == true) { 
                    $('.trx').prop('checked', true); 
					if ($(".ch").not(':checked').length == 0){
                    	$('#allCheck').prop('checked', true); 
					}else{
						$('#allCheck').prop('checked', false); 
					}
                } 
    }); 

    $('.trx').click(function() { 
                if ($(".trx input:checkbox:checked").length == 0) { 
                    $('#allTrx').prop('checked', false); 
                    $('#allCheck').prop('checked', false); 
                }
                if ($(".trx").not(':checked').length == 0) { 
                    $('#allTrx').prop('checked', true); 
					if ($(".ch").not(':checked').length == 0){
                    	$('#allCheck').prop('checked', true); 
					}else{
						$('#allCheck').prop('checked', false); 
					}
                }
    }); 
	
    $('#allMas').click(function() { 
                if ($("#allMas").is(":checked") == true) { 
                    $('.mas').prop('checked', true); 
					if ($(".ch").not(':checked').length == 0){
                    	$('#allCheck').prop('checked', true); 
					}else{
						$('#allCheck').prop('checked', false); 
					}
                } 
    }); 
    $('.mas').click(function() { 
                if ($(".mas input:checkbox:checked").length == 0) { 
                    $('#allMas').prop('checked', false); 
                    $('#allCheck').prop('checked', false); 
                }
                if ($(".mas").not(':checked').length == 0) { 
                    $('#allMas').prop('checked', true); 
					if ($(".ch").not(':checked').length == 0){
                    	$('#allCheck').prop('checked', true); 
					}else{
						$('#allCheck').prop('checked', false); 
					}
                }
    }); 
	
    $('#allStk').click(function() { 
                if ($("#allStk").is(":checked") == true) { 
                    $('.stk').prop('checked', true); 
					if ($(".ch").not(':checked').length == 0){
                    	$('#allCheck').prop('checked', true); 
					}else{
						$('#allCheck').prop('checked', false); 
					}
                } 
    }); 
    $('.stk').click(function() { 
                if ($(".stk input:checkbox:checked").length == 0) { 
                    $('#allStk').prop('checked', false); 
                    $('#allCheck').prop('checked', false); 
                }
                if ($(".stk").not(':checked').length == 0) { 
                    $('#allStk').prop('checked', true); 
					if ($(".ch").not(':checked').length == 0){
                    	$('#allCheck').prop('checked', true); 
					}else{
						$('#allCheck').prop('checked', false); 
					}
                }
    }); 
	
    $('#allRpt').click(function() { 
                if ($("#allRpt").is(":checked") == true) { 
                    $('.rpt').prop('checked', true); 
					if ($(".ch").not(':checked').length == 0){
                    	$('#allCheck').prop('checked', true); 
					}else{
						$('#allCheck').prop('checked', false); 
					}
                } 
    }); 
    $('.rpt').click(function() { 
                if ($(".rpt input:checkbox:checked").length == 0) { 
                    $('#allRpt').prop('checked', false); 
                    $('#allCheck').prop('checked', false); 
                }
                if ($(".rpt").not(':checked').length == 0) { 
                    $('#allRpt').prop('checked', true); 
					if ($(".ch").not(':checked').length == 0){
                    	$('#allCheck').prop('checked', true); 
					}else{
						$('#allCheck').prop('checked', false); 
					}
                }
    }); 
	
    $('#allMgt').click(function() { 
                if ($("#allMgt").is(":checked") == true) { 
                    $('.mgt').prop('checked', true); 
					if ($(".ch").not(':checked').length == 0){
                    	$('#allCheck').prop('checked', true); 
					}else{
						$('#allCheck').prop('checked', false); 
					}
                } 
    }); 
    $('.mgt').click(function() { 
                if ($(".mgt input:checkbox:checked").length == 0) { 
                    $('#allMgt').prop('checked', false); 
                    $('#allCheck').prop('checked', false); 
                }
                if ($(".mgt").not(':checked').length == 0) { 
                    $('#allMgt').prop('checked', true); 
					if ($(".ch").not(':checked').length == 0){
                    	$('#allCheck').prop('checked', true); 
					}else{
						$('#allCheck').prop('checked', false); 
					}
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
        location.replace('/picaPOS/admin/mUser/');
    });
	
    $("#del").click(function(){
        var r = confirm("Apakah yakin ingin menghapus user ini?");
        if(r){
            <?php echo "location.replace('user_delete.php?userID=$userID');"?>
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