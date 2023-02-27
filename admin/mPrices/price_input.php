<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");		
include('../../assets/template/navbar.php');

$queryOu = mysql_query("SELECT * FROM moutlet WHERE outletID = '$_SESSION[outletID]'");
$rowOu = mysql_fetch_array($queryOu);


if($_GET['priceID']==""){
    $queryItemID = "SELECT count(priceID)+1 as priceID FROM tabpriceheader";
    $resItemID = mysql_query($queryItemID);
    $row = mysql_fetch_array($resItemID);
    $priceID = $row['priceID'];
}else{
    $priceID = $_GET['priceID'];
    $query = "SELECT h.priceID, h.priceName, d.productID, p.productName, d.price, h.description, h.lastChanged FROM tabpriceheader h
            INNER JOIN tabpricedetail d ON h.priceID = d.priceID
            INNER JOIN mproduct p ON d.productID = p.productID
            WHERE h.priceID ='$priceID'";
    $res = mysql_query($query);
    $row = mysql_fetch_array($res);
}			
?>
<div class="">
		<div class='clear height-20 mt-3'></div>
		<div class="container-fluid">
			<div class='entry-box-basic'>
                <h1>
					<a href='/picaPOS/admin/mPrices' style='text-decoration:none;color:black;'><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
	  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
	</svg>
						ADD/EDIT PRICE LIST
					</a>

<?php 

					if($_GET['priceID']!=""){
echo "<button type='button' id='del' style='border:none;background-color:rgba(255, 255, 255, 0);'>
        <svg xmlns='http://www.w3.org/2000/svg' width='32' height='32' class='bi bi-trash' viewBox='0 0 16 16'>
        <path d='M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z'/>
        <path fill-rule='evenodd' d='M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z'/>
        </svg>
	   </button>";
                    
                } ?>
				</h1>
                <form id='formAdd' method='POST' action='price_process.php'>
					<div class='container-fluid'>
						<div class='row mt-2'>
							<div class='col'>
								<input type='hidden' class='type-input' name='priceID' value='<?php echo $priceID; ?>'/>
								<!-- <input type='hidden' name='itemCount' id='itemCount' value='0' /> -->
							</div>
						</div>

						<div class='row  mt-3 '>
							<div class='col-2 label'>
	                           <input type='text' class='form-control-plaintext' disabled value='PRICE NAME' />
	                        </div>
							<div class='col-4'>
								<input type='text' class='type-input form-control' name='priceName' placeholder='Insert Price Name' style='width:300px' value='<?php echo $row[priceName]; ?>' required />
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
											if($rowOutlet[outletID] == $rowOu[outletID]){
												echo "<option selected value='$rowOu[outletID]'>$rowOu[outletName]</option>";
											}else{
												echo "<option value='$rowOutlet[outletID]'>$rowOutlet[outletName]</option>";
											}

										}
									?>
								</select>
							</div>
						</div>

						<div class='row  mt-3 '>
	                        <div class='col-2 label'>
	                           <input type='text' class='form-control-plaintext' disabled value='DESCRIPTION' />
	                        </div>
	                        <div class='col-4'>
	                            <textarea class='type-input form-control' name='description' placeholder='Insert notes here' rows='4' cols='50'><?php echo $row[description]; ?></textarea>
	                        </div>
						</div>

						<div class='row  mt-3'>
							<div class='col-3'>
								<input id='save' type='submit' value='ADD NAME PRICE' class='btn btn-success' />
								<button type='button' id='cancel' class='btn btn-danger'>CANCEL</button>  
							</div>
						</div>
					</div>
				<br/>
				</form>
            </div>
		</div>
        </div>
	</body>
</html>
<script type="text/javascript">


	$("#cancel").click(function(){
        alert("Data tidak tersimpan");
        location.replace('/picaPOS/admin/mPrices/');
    });
	
    $("#del").click(function(){
        var r = confirm("Apakah yakin ingin menghapus data ini?");
        if(r){
            <?php echo "location.replace('price_delete.php?priceID=$priceID');"?>
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