<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/app"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
} 
include("../../assets/config/db.php");		
include('../../assets/template/navbar_app.php');

?>
<style>
	.label{
			margin-right: 20px;
	}
</style>
<?php
$periode = date("Y-m");
$openDate = date("Y-m-d");
$per = date("Ym");

if($_GET['openID']==""){
    $queryOpenNew = mysql_query("SELECT count(openID)+1 as count FROM tabopencashier WHERE outletID = '$_SESSION[outletID]'");
    $row = mysql_fetch_array($queryOpenNew);
    $count = $row['count'];
	
	$openID = "PCA/OPEN/$per/".str_pad($count,4,"0",STR_PAD_LEFT);
	$openDate = date("Y-m-d");
	$fullName = $_SESSION['fullname'];
	
	$resOutlet = mysql_query("SELECT * FROM mOutlet WHERE outletID = '$_SESSION[outletID]'");
	$rowO = mysql_fetch_array($resOutlet);
	$outletName = $rowO[outletName];
	$grandTotal = 0;
	$totalReceived = 0;
	
	
}else{
    $openID = $_GET['openID'];
    $queryGet = mysql_query("SELECT o.*,u.fullName FROM tabopenheader o INNER JOIN mUser u ON u.userID = o.userID WHERE o.openID ='$openID'");
    $row = mysql_fetch_array($queryGet);
	// $closeDate = $row['closeDate'];
	// $periode = $row['closePeriode'];
	// $fullName = $row['fullname'];
	// $grandTotal = $row['grandTotal'];
	// $totalReceived = $row['totalReceived'];
	// $grandTot = "Rp. ".number_format($grandTotal,0,",",".").",-";
	// $received= "Rp. ".number_format($totalReceived,0,",",".").",-";
}			
?>

<div class="">
		<div class='clear height-20 mt-3'></div>
		<div class="container-fluid">
			<div class='entry-box-basic'>
                <h3>OPEN CASHIER</h3>
                <form id='formOpen' method='POST' action='open_process.php'>
					
					<div class='row  mt-3 '>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' style='width:150px' disabled value='OPEN ID' />
                        </div>
                        <div class='col-4'>
                            <input type='text' class='form-control' name='openID' id='openID' style='width:300px' value='<?php echo $openID; ?>' required readonly/>
                        </div>
					</div>
					
					<div class='row  mt-1 '>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' style='width:150px' disabled value='OPEN DATE' />
                        </div>
                        <div class='col-4'>
                            <input type='date' class='form-control' name='openDate' id='openDate' style='width:300px' value='<?php echo $openDate; ?>' readonly required />
                        </div>
					</div>
					
					<div class='row  mt-1 '>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' style='width:150px' disabled value='OUTLET' />
                        </div>
                        <div class='col-4'>
                            <input type='text' class='form-control' name='outletName' id='outletName' style='width:300px' value='<?php echo $outletName; ?>' disabled />
							<input type='hidden' name='outletID' id = 'outletID' value='<?php echo $_SESSION[outletID]; ?>'>
                        </div>
					</div>
					
					<div class='row  mt-1 '>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' style='width:150px' disabled value='PERIODE' />
                        </div>
                        <div class='col-4'>
                            <input type='text' class='form-control' name='closePeriode' id='closePeriode' style='width:300px' value='<?php echo $periode; ?>' readonly required />
                        </div>
					</div>
					
					<div class='row  mt-1 '>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' style='width:150px' disabled value='CASHIER' />
                        </div>
                        <div class='col-4'>
                            <input type='text' class='form-control' name='fullName' id='fullName' style='width:300px' value='<?php echo $fullName; ?>'readonly required />
                            <input type='hidden' name='userID' id='userID' value='<?php echo $userID; ?>'/>
                        </div>
					</div>
					
					<div class='row  mt-1 '>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' style='width:150px' disabled value='SESSION' />
                        </div>
                        <div class='col-4'>
                            <select class='form-control' name='closeShift' id='closeShift' style='width:300px;' required>
                                <option value=''>-CHOOSE ONE-</option>
                                <option value='1' $session1 >1</option>
                                <option value='2' $session2 >2</option>
							</select>
                        </div>
					</div>
					
					<div class='row  mt-1 '>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' style='width:150px' disabled value='TOTAL' />
                        </div>
                        <div class='col-4'>
                            <input type='text' class='form-control' id='dppTotal' style='width:300px' value='<?php echo $grandTot; ?>'readonly required />
							<input type='hidden' name='dppTotal' id = 'dppTot' value='<?php echo $grandTotal; ?>'>
                        </div>
					</div>
					<div class='row  mt-1 '>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' style='width:150px' disabled value='TAX' />
                        </div>
                        <div class='col-4'>
                            <input type='text' class='form-control' id='taxTotal' style='width:300px' value='<?php echo $grandTot; ?>'readonly required />
							<input type='hidden' name='taxTotal' id = 'taxTot' value='<?php echo $grandTotal; ?>'>
                        </div>
					</div>
					<div class='row  mt-1 '>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' style='width:150px' disabled value='GRANDTOTAL' />
                        </div>
                        <div class='col-4'>
                            <input type='text' class='form-control' id='grandTotal' style='width:300px' value='<?php echo $grandTot; ?>'readonly required />
							<input type='hidden' name='grandTotal' id = 'grandTot' value='<?php echo $grandTotal; ?>'>
                        </div>
					</div>
<?php
					
					$resPayMethod = mysql_query("SELECT * FROM mpaymentmethod WHERE status = 1");
					$closeDate = date('Y-m-d');
					while($rowP = mysql_fetch_array($resPayMethod)){
						$payName = $rowP[methodName];
						$payID = "Method_$rowP[methodID]";
						$payMetID = "Meth_$rowP[methodID]";
					$querySplit = mysql_query("SELECT SUM(p.total) AS splitTotal FROM tabpaymentorder p
									INNER JOIN taborderheader o ON p.orderID = o.orderID
									WHERE paymentMethod = '$rowP[methodID]' AND orderDate = '$closeDate'");
						
						
echo			   "<div class='row mt-1 '>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' style='width:150px' disabled value='$payName' />
                        </div>
                        <div class='col-4'>
                            <input type='text' class='form-control' id='payID_".$payID."' style='width:300px' readonly required />
							<input type='hidden' name='grandTotals' id = 'Meth_".$payID."'>
                        </div>
					</div>";
					}
					
?>
					<div class='row  mt-1 '>
                        <div class='col-2 label'>
                            <input type='text' class='form-control-plaintext' style='width:150px' disabled value='RECEIVED' />
                        </div>
                        <div class='col-4'>
                            <input type='text' class='form-control' id='totalReceived' style='width:300px' value='<?php echo $received; ?>'readonly required />
							<input type='text' name='totalReceived' id = 'received' value='<?php echo $totalReceived; ?>'>
                        </div>
					</div>
					
					<div class='row  mt-1 '>
                        <div class='col-2 label'>
                            REMARKS
                        </div>
                        <div class='col-4'>
                            <textarea class='form-control' name='remarks' placeholder='Insert notes here' style='width:300px' rows='4' cols='25'><?php echo $row[remarks]; ?></textarea>
                        </div>
					</div>
					
					<div class='row  mt-3 '>
                        <div class='col-5' style='text-align:center;margin-left:-50px;'>
							<button type='button' id='generate' class='btn btn-info' >GENERATE</button>  
							<button type='button' id='save' class='btn btn-success' >SAVE</button>  
                        </div>
					</div>
                    
					<div class='row  mt-3 '>
                        <div class='col-20'>
							<table class='table' id='detailData' style='font-size:13px;'>
								  <thead>
									<tr>
									  <th style='vertical-align:middle;'>NO</th>
									  <th style='vertical-align:middle;'>ORDER ID</th>
									  <th style='vertical-align:middle;'>ORDER DATE</th>
									  <th style='vertical-align:middle;'>TOTAL</th>
									  <th style='vertical-align:middle;'>TAX</th>
									  <th style='vertical-align:middle;'>GRAND TOTAL</th>
									  <th style='vertical-align:middle;'>RECEIVED</th>
									  <th style='vertical-align:middle;'>PAYMENT METHOD</th>
									  <th style='vertical-align:middle;'>PAYER</th>
									  <th style='vertical-align:middle;'>REMARKS</th>
									  <th style='vertical-align:middle;'>USER</th>
									</tr>
								  </thead>
								  <tbody>

								  </tbody>
							</table>
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
        $('#detailData').hide();
        $('#save').hide();
    });
	
	$("#generate").click(function(){
		var closeID = $('#closeID').val();
		var closeDate = $('#closeDate').val();
		var outletID = $('#outletID').val();
		var closeShift = $('#closeShift').val();
		
		var grand = 0;
		var received = 0;
		var method = $('#payID').val();
		
		var detailData = $('#detailData').DataTable(
		{

			processing : false,
			responsive : true,
			ajax: {
				url: "detail_data.php",
				data: { closeID: closeID, closeDate: closeDate, outletID: outletID, closeShift: closeShift }
			},  
			columns: [
				{ data: 'no' },
				{ data: 'orderID' },
				{ data: 'orderDate' },
				{ data: 'dpp' },
				{ data: 'vat' },
				{ data: 'total'},
				{ data: 'paymentAmount'},
				{ data: 'methodName' },
				{ data: 'payerName' },
				{ data: 'remarks' },
				{ data: 'fullname' }
			],
    		"columnDefs": [
				{"className": "dt-center", "targets": "_all"}
			]
		});
		
		var get = "detail_sum.php?closeID="+closeID+"&closeDate="+closeDate+"&outletID="+outletID+"&closeShift="+closeShift;
		$.get(get, function( data ) {
			var dpp = data.dpp;
			var VAT = data.VAT;
			var total = data.total;
			var paymentAmount = data.paymentAmount;

			// var totalA = dataA.total;
			// var paymentAmountA = dataA.paymentAmount;
			$('#dppTot').val(dpp);
			$('#taxTot').val(VAT);
			$('#grandTot').val(total);
			$('#received').val(paymentAmount);
			
			// $('#payID').val(paymentAmountA);
			var dppTotal = dpp;
			var taxTotal = VAT;
			var grandTotal = total;
			var totalReceived = paymentAmount;
			// var splitA = paymentAmountA;
			// var totalReceived = paymentAmount;
			dppTotal = "Rp. "+dppTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")+",-";
			taxTotal = "Rp. "+taxTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")+",-";
			grandTotal = "Rp. "+grandTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")+",-";
			totalReceived = "Rp. "+totalReceived.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")+",-";
			// splitA = "Rp. "+splitA.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")+",-";

			$('#dppTotal').val(dppTotal);
			$('#taxTotal').val(taxTotal);
			$('#grandTotal').val(grandTotal);
			$('#totalReceived').val(totalReceived);
			// $('#totalReceived').val(totalReceived);
			
			console.log(data.arrayNew);
			for(var payment of data.arrayNew){
				$(payment.id).val(payment.total);
				$(payment.id2).val(payment.total);
			}
			
		}, "json" );
		
        $('#detailData').show();
        $('#save').show();
		
    });
	
	$("#closeDate").change(function(){
		var closeDate = $('#closeDate').val();
		var d = new Date(closeDate);
	
		var mo = parseInt(d.getMonth())+1;
		mo = mo.toString();
		mo = mo.padStart(2,"0");
		var y = d.getFullYear();
		
		var period = y+"-"+mo;
		
		$('#closePeriode').val(period);
    });
	
    $("#save").click(function(){
		
		$('form#formClose').submit();   
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