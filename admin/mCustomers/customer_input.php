<?php
include("../../assets/config/db.php");		
include('../../assets/template/navbar.php');
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
date_default_timezone_set('Asia/Jakarta');
$date = date("ymd");
$query = mysql_query("SELECT * FROM muser WHERE username = '$_SESSION[username]'");
$data = mysql_fetch_array($query);

if($_GET['customerID']==""){
    $queryItemID = "SELECT count(customerID)+1 as customerID FROM mcustomer";
    $resItemID = mysql_query($queryItemID);
    $row = mysql_fetch_array($resItemID);
    $customerID = $row['customerID'];
}else{
    $customerID = $_GET['customerID'];
    $query = "SELECT * FROM mcustomer WHERE customerID ='$customerID'";
    $res = mysql_query($query);
    $row = mysql_fetch_array($res);
    // $supplierID = $row['supplierID'];
    // $suppUCode = "SPL-".$date.-$supplierID;
}			
?>
<div>
		<div class='clear height-20 mt-3'></div>
		<div class="container-fluid">
			<div class='entry-box-basic'>
                <h1>
                    <a href='/picaPOS/admin/mCustomers' style='text-decoration:none;color:black;'><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
      <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
    </svg>
                        ADD/EDIT CUSTOMER
                    </a>

<?php 

					if($_GET['customerID']!=""){
echo "<button type='button' id='del' style='border:none;background-color:rgba(255, 255, 255, 0);'>
        <svg xmlns='http://www.w3.org/2000/svg' width='32' height='32' class='bi bi-trash' viewBox='0 0 16 16'>
        <path d='M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z'/>
        <path fill-rule='evenodd' d='M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z'/>
        </svg>
	   </button>";
                    
                } ?>
				</h1>
                <form id='formAdd' method='POST' action='customer_process.php'>
                    <div class='row mt-2'>
                        <div class='col'>
                            <input type='hidden' class='type-input' name='customerID' value='<?php echo $customerID; ?>' readonly/>
                        </div>
					</div>
					
					<div class='row  mt-3 '>
                        <div class='col-2 label'>
                           <input type='text' class='form-control-plaintext' disabled value='CUSTOMER NAME' />
                        </div>
                        <div class='col-4'>
                            <input type='text' class='type-input form-control' name='customerName' placeholder='Customer Name' style='width:300px' value='<?php echo $row[customerName]; ?>' required />
                        </div>
					</div>
					
					<div class='row  mt-3 '>
                        <div class='col-2 label'>
                           <input type='text' class='form-control-plaintext' disabled value='CUSTOMER PHONE' />
                        </div>
                        <div class='col-4'>
                            <input type='text' class='type-input form-control' name='customerPhone' placeholder='Customer Phone' style='width:300px' value='<?php echo $row[customerPhone]; ?>' required />
                        </div>
                    </div>

                    <div class='row  mt-3 '>
                        <div class='col-2 label'>
                           <input type='text' class='form-control-plaintext' disabled value='CUSTOMER EMAIL' />
                        </div>
                        <div class='col-4'>
                            <input type='text' class='type-input form-control' name='customerEmail' placeholder='Customer Email' style='width:300px' value='<?php echo $row[customerEmail]; ?>' />
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
    
	$("#cancel").click(function(){
        alert("Data tidak tersimpan");
        location.replace('/picaPOS/admin/mCustomers/');
    });
	
    $("#del").click(function(){
        var r = confirm("Apakah yakin ingin menghapus data ini?");
        if(r){
            <?php echo "location.replace('customer_delete.php?customerID=$customerID');"?>
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