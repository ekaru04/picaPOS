<?php 
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
	include('../../assets/template/navbar.php');
	include('../../assets/config/db.php');

$orderID = $_GET[orderID];

$res = mysql_query("SELECT h.orderID, h.orderNo, h.orderDate, h.orderPeriode, h.orderAmount, h.orderMethod, o.outletName, m.methodName, p.total, u.fullname, h.remarks, h.status, h.lastChanged FROM taborderheader h
INNER JOIN moutlet o ON h.outletID = o.outletID
INNER JOIN tabpaymentorder p ON h.orderID = p.orderID
INNER JOIN muser u ON h.userID = u.userID
INNER JOIN mpaymentmethod m ON p.paymentMethod = m.methodID
WHERE h.orderID = '$orderID'");
$row = mysql_fetch_array($res);



$totalPrice = "Rp. ".number_format($row["total"]).",-";
	
?>
<div>
    <!-- Content Header (Page header) -->
    <!-- /.content-header -->

    <!-- Main content -->
    <div class='clear height-20 mt-3'></div>
    <div class="container-fluid">
      <div class='entry-box-basic'>
      <h4 align='center'>
        <span style='float:left;'>
        <a href='/picaPOS/admin/transactionReport' style='text-decoration:none;color:black;'><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
</svg>
      </a> 
      </span>DETAIL <?php echo $row['orderID'];?></h4>
      <div class="row mb-2">
      </div>
      <div class='height-10'></div>

      <div class="container-fluid">
          <form id='formAdd' method='POST' action='method_process.php'>
            <div class='row mt-2 justify-content-center'>
              <div class='col'>
                <input type='hidden' class='type-input' value='<?php echo $orderID; ?>'/>
              </div>
            </div>

            <div class='row mt-3 '>
              <div class='col-2 label'>
                <input type='text' class='form-control-plaintext' disabled value='ORDER ID' />
              </div>
              <div class='col-4'>
                <input type='text' class='form-control' style='width:300px' value='<?php echo $orderID; ?>' disabled/>
              </div>
            </div>

            <div class='row mt-3 '>
              <div class='col-2 label'>
                <input type='text' class='form-control-plaintext' disabled value='Order Method' />
              </div>
              <div class='col-4'>
                <?php if($row[orderMethod] == 1): ?>
                <input type='text' class='form-control' style='width:300px' value='<?php echo "Dine In"; ?>' disabled/>
                <?php else: ?>
                <input type='text' class='form-control' style='width:300px' value='<?php echo "Take Away"; ?>' disabled/>
              <?php endif; ?>
              </div>
            </div>

            <div class='row mt-3 '>
              <div class='col-2 label'>
                <input type='text' class='form-control-plaintext' disabled value='Total Product' />
              </div>
              <div class='col-4'>
                <input type='text' class='form-control' style='width:300px' value='<?php echo $row[orderAmount]; ?>' disabled/>
              </div>
            </div>

            <div class='row mt-3 '>
              <div class='col-2 label'>
                <input type='text' class='form-control-plaintext' disabled value='Total Payment' />
              </div>
              <div class='col-4'>
                <input type='text' class='form-control' style='width:300px' value='<?php echo $totalPrice; ?>' disabled/>
              </div>
            </div>

            <div class='row mt-3 '>
              <div class='col-2 label'>
                <input type='text' class='form-control-plaintext' disabled value='Payment Method' />
              </div>
              <div class='col-4'>
                <input type='text' class='form-control' style='width:300px' value='<?php echo $row[methodName]; ?>' disabled/>
              </div>
            </div>

            <div class='row  mt-3 '>
              <div class='col-2 label'>
                <input type='text' class='form-control-plaintext' disabled value='REMARKS' />
              </div>
              <div class='col-4'>
                <textarea class='form-control' rows='4' cols='50' disabled><?php echo $row[remarks]; ?></textarea>
              </div>
            </div>     
          </form>
      </div>

        <table class='table' id='itemTable' style='font-size:13px;'>
          <thead>
            <tr>
              <th style='vertical-align:middle;'>NO</th>
              <th style='vertical-align:middle;'>ORDER ID</th>
              <th style='vertical-align:middle;'>PRODUCT NAME</th>
              <th style='vertical-align:middle;'>PRODUCT AMOUNT</th>
              <th style='vertical-align:middle;'>TOTAL</th>
              <th style='vertical-align:middle;'>LAST UPDATED</th>
            </tr>
          </thead>
          <tbody>

          </tbody>
        </table>
      </div>  
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>
<script type="text/javascript">
    
var itemTable = $('#itemTable').DataTable(
    {
       
        processing : false,
        responsive : true,
        ajax: {
            url: "detail_data.php?orderID=<?php echo $_GET[orderID];?>",
            data: 'data'
        },
        columns: [
            { data: 'no' },
            { data: 'orderID' },
            { data: 'productName' },
            { data: 'productAmount' },
            { data: 'productSubtotal' },
            { data: 'lastChanged' }
        ],
    "columnDefs": [
        {"className": "dt-center", "targets": "_all"}
      ],
      dom: 'Bfrtip',
        buttons: [
            {
                extend: 'excelHtml5',
                exportOptions: {
                    columns: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
                }
            },
            {
                extend: 'pdfHtml5',
                exportOptions: {
                    columns: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
                }
            }
        ]
        
    }
        
);
    
function excel(){
    location.href='item_list_xls.php';
}
    
$("#add").click(function(){
    location.replace('supplier_input.php');
});
    
</script>

<script>
  $(window).load(function() { $(".se-pre-con").fadeOut("slow"); });  
</script>
<!-- AdminLTE App -->
<script src="../../assets/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../../assets/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../assets/dist/js/demo.js"></script>
</body>
</html>
