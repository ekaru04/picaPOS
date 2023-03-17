<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");		
include('../../assets/template/navbar.php');


if($_GET['productID']==""){
    $queryItemID = "SELECT count(productID)+1 as productID, SUM(newStock) AS newStock FROM tabproductstocktemp";
    $resItemID = mysql_query($queryItemID);
    $row = mysql_fetch_array($resItemID);
    $productID = $row['productID'];
}else{
    $productID = $_GET['productID'];
    $query = "SELECT p.productName, SUM(t.newStock) AS newStock FROM tabproductstocktemp t 
    			INNER JOIN mproduct p ON p.productID = t.productID WHERE t.productID ='$productID'";
    $res = mysql_query($query);
    $row = mysql_fetch_array($res);
}			
?>
<div>
		<div class='clear height-20 mt-3'></div>
		<div class="container-fluid">
			<div class='entry-box-basic'>
                <h1>
                    <a href='/picaPOS/admin/sentToStore' style='text-decoration:none;color:black;'><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
      <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
    </svg>
                        SENT STOCK TO STORE
                    </a>
<?php 

					if($_GET['productID']!=""){
echo "<button type='button' id='del' style='border:none;background-color:rgba(255, 255, 255, 0);'>
        <svg xmlns='http://www.w3.org/2000/svg' width='32' height='32' class='bi bi-trash' viewBox='0 0 16 16'>
        <path d='M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z'/>
        <path fill-rule='evenodd' d='M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z'/>
        </svg>
	   </button>";
                    
                } ?>
				</h1>
            <div class="container-fluid">

	                <div class="col-8">
	                   <form id='formAdd' method='POST' action='sent_process.php' enctype="multipart/form-data">

	                    <div class='row mt-2'>
	                        <div class='col-3'>
	                            <input type='text' class='type-input' name='productID' value='<?php echo $productID; ?>'/>
	                        </div>
	                    </div>

	                    <div class='row mt-3'>
	                        <div class='col-6'>
	                        	<label>Product Name</label>
	                            <input type='text' class='type-input form-control' name='productName' placeholder='product Name' style='width:300px' value='<?php echo $row[productName]; ?>' disabled readonly />
	                        </div>
	                    </div>

	                    <div class='row mt-3'>
	                        <div class='col-6'>
	                        	<label>Product Stock</label>
	                            <input type='text' class='type-input form-control' name='productName' placeholder='product Name' style='width:300px' value='<?php echo $row[newStock]; ?>' disabled readonly />
	                        </div>
	                    </div>

	                    <div class='row mt-3'>
	                        <div class='col-6'>
	                        	<label>Insert Amount Stock Product</label>
	                            <input type='text' class='type-input form-control' name='sentStock' placeholder='Insert Amount Stock' style='width:300px;'/>
	                        </div>	                    	
	                    </div>
	                    
	                    <div class='row  mt-3'>
	                        <div class='col-4'>
	                            <input id='save' type='submit' value='SENT' name='submit' class='btn btn-success' />
	                            <button type='button' id='cancel' class='btn btn-danger' >CANCEL</button>  
	                        </div>
	                    </div>

	                </form>                
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
        location.replace('/picaPOS/admin/sentToStore/');
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