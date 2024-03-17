<?php 
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
	include('../../assets/template/navbar.php');
	include('../../assets/config/db.php');
	date_default_timezone_set('Asia/Jakarta');
  $date = date('his');
// echo $date;
//echo $dueExpire;

?>
<div>
    <!-- Content Header (Page header) -->
    <!-- /.content-header -->

    <!-- Main content -->
    <div class='clear height-20 mt-3'></div>
    <div class="container-fluid">
      <div class='entry-box-basic'>
      <h4 align='center'>TRANSACTION RESTOCK ITEM</h4>
      <div class="row mb-2">
          <div class="col">
            <h1 class="m-0 text-dark text-center"></h1>
            <hr>
            
          </div>
          <div class="">
            <!-- <button type='button' id='addStock' class='btn btn-primary mr-1' style='float: right;margin-top:13px; font-size:13px;'>ADD CURRENT STOCK</button> -->
            <button type='button' id='add' class='btn btn-primary' style='float: right;margin-top:13px; font-size:13px;'>ADD NEW TRANSACTIONS</button>
          </a>
          </div>
          <div class="col">
            <h1 class="m-0 text-dark text-center"></h1>
            <hr>
          </div>
      </div>
      <div class='height-10'></div>
      <div class="table-responsive">        
        <table class='table' id='itemTable' style='font-size:13px;'>
          <thead>
            <tr>
              <th style='vertical-align:middle;'>NO</th>
              <th style='vertical-align:middle;'>TRANS DATE</th>
              <th style='vertical-align:middle;'>SUPPLIER</th>
              <th style='vertical-align:middle;'>ITEM</th>
              <th style='vertical-align:middle;'>ADDING STOCK</th>
              <th style='vertical-align:middle;'>MEASUREMENT</th>
              <th style='vertical-align:middle;'>TOTAL PRICE</th>
              <th style='vertical-align:middle;'>DISC. PRICE</th>
              <th style='vertical-align:middle;'>AFTER DISC.</th>
              <th style='vertical-align:middle;'>USER</th>
              
              <!-- <th style='vertical-align:middle;'>ACTION</th> -->
            </tr>
          </thead>
          <tbody>

          </tbody>
        </table>
      </div>
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
<script type="text/javascript">
    
var itemTable = $('#itemTable').DataTable(
    {
       
        processing : false,
        responsive : true,
        ajax: {
            url: "restock_item_data.php",
            data: 'data'
        },
        columns: [
            { data: 'no' },
            { data: 'transItemDate' },
            { data: 'supplierName' },
            { data: 'stockName' },
            { data: 'amountBuy' },
            { data: 'measurementName' },
            { data: 'totalPrice' },
            { data: 'discountPrice' },
            { data: 'afterDiscount' },
            { data: 'fullname' }
        ],
    "columnDefs": [
        {"className": "dt-center", "targets": "_all"}
      ]
        
    }
        
);
    
function excel(){
    location.href='item_list_xls.php';
}
    
$("#add").click(function(){
    location.replace('restock_item_input.php');
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
