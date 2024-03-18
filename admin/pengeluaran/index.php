<?php 
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
    include('../../assets/template/navbar.php');
    include('../../assets/config/db.php');
    
?>
<div>
    <!-- Content Header (Page header) -->
    <!-- /.content-header -->

    <!-- Main content -->
    <div class='clear height-20 mt-3'></div>
    <div class="container-fluid">
      <div class='entry-box-basic'>
      <h4 class='text-center'>PENGELUARAN</h4>
      <div class="row mb-2">
          <div class="col">
            <h1 class="m-0 text-dark text-center"></h1>
            <hr>
            
          </div>
          <div class="">
            <!-- <button type='button' id='addStock' class='btn btn-primary mr-1' style='float: right;margin-top:13px; font-size:13px;'>ADD CURRENT STOCK</button> -->
            <!-- <button type='button' id='add' class='btn btn-primary' style='float: right;margin-top:13px; font-size:13px;'>ADD NEW</button> -->
          </a>
          </div>
          <div class="col">
            <h1 class="m-0 text-dark text-center"></h1>
            <hr>
          </div>
      </div>
      <table id='searchDateBox'>
        <tr>
          <input type='date' id='date1'/> - <input type='date' id='date2'/>
            <!-- <select class="ml-1 col-3" name="status" id="status">
              <option value="">STATUS</option>
              <option value="0">ALL</option>
              <option value="1">SUCCESS</option>
              <option value="9">FAILED</option>
            </select> -->
          <button type='button' id='searchDate' class='btn btn-primary ml-1' style='font-size:10px;'>Search</button>
        </tr>
      </table>
      <div class='height-10'></div>
        <table class='table' id='itemTableIngredient' style='font-size:13px;'>
          <thead>
            <tr>
              <th style='vertical-align:middle;'>NO</th>
              <th style='vertical-align:middle;'>TRANS DATE</th>
              <th style='vertical-align:middle;'>INGREDIENT</th>
              <th style='vertical-align:middle;'>MEASUREMENT</th>
              <th style='vertical-align:middle;'>AMOUNT BUY</th>
              <th style='vertical-align:middle;'>CURRENT STOCK</th>
              <th style='vertical-align:middle;'>TOTAL PRICE</th>
              <th style='vertical-align:middle;'>DISCOUNT</th>
              <th style='vertical-align:middle;'>AFTER DISCOUNT</th>
              <th style='vertical-align:middle;'>PIC</th>
              <th style='vertical-align:middle;'>LAST UPDATED</th>
            </tr>
          </thead>
          <tbody>

          </tbody>
        </table>
      </div>  
      <hr>
      <div class='height-10'></div>
        <table class='table' id='itemTableStock' style='font-size:13px;'>
          <thead>
            <tr>
              <th style='vertical-align:middle;'>NO</th>
              <th style='vertical-align:middle;'>TRANS DATE</th>
              <th style='vertical-align:middle;'>ITEM</th>
              <th style='vertical-align:middle;'>MEASUREMENT</th>
              <th style='vertical-align:middle;'>AMOUNT BUY</th>
              <th style='vertical-align:middle;'>CURRENT STOCK</th>
              <th style='vertical-align:middle;'>TOTAL PRICE</th>
              <th style='vertical-align:middle;'>DISC. PRICE</th>
              <th style='vertical-align:middle;'>AFTER DISC.</th>
              <th style='vertical-align:middle;'>PIC</th>
              <th style='vertical-align:middle;'>LAST UPDATED</th>
            </tr>
          </thead>
          <tbody>

          </tbody>
        </table>
      </div>  
    </div>
    
    <div class="container">
      <?php 
      
          // $queryTotalIngredient = mysql_query("SELECT ")
      
      ?>
      <div class="row">
        <div class="form-group col-sm-4">
          <h6><b>Total Ingredient (Rp.)</b></h6>
          <input type="text" name="totalIngre" id="totalIngre" class="form-control" readonly>
          <input type="hidden" name="totalIngre" id="totalIngres" class="form-control" readonly>
        </div>
        <div class="form-group col-sm-4">
          <h6><b>Total Stock Item (Rp.)</b></h6>
          <input type="text" name="totalItem" id="totalItem" class="form-control" readonly>
          <input type="hidden" name="totalItem" id="totalItems" class="form-control" readonly>
        </div>
        <div class="form-group col-sm-4">
          <h6><b>Total Keseluruhan (Rp.)</b></h6>
          <input type="text" name="grandTotal" id="grandTotal" class="form-control" readonly>
        </div>
      </div>
      <div class="text-center">
        <div class="">
          <button type='button' id='generate' class='btn btn-info' >GENERATE</button>
        </div>
      </div>
    </div>
    
    <!-- /.content -->
  </div>
  
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


$(document).ready(function(){
  var date1 = $("#date1").val('<?php echo date("Y-m-d");?>');
  var date2 = $("#date2").val('<?php echo date("Y-m-d");?>');
  var status = $("#status").val('');
  $("#searchDate").click(function(){searchDateJournal();}); 
  
  console.log(date1);
  console.log(date2);

});

function searchDateJournal()
{
    var startDate = new Date($('#date1').val());
    var endDate = new Date($('#date2').val());
    var stat = $('#status').val();
      if (startDate <= endDate){
          var urlS = "ingredient_data.php?date1="+$("#date1").val()+"&date2="+$("#date2").val();
          var urlS2 = "stock_data.php?date1="+$("#date1").val()+"&date2="+$("#date2").val();
          itemTableIng.ajax.url(urlS).load();
          itemTableStk.ajax.url(urlS2).load();
      }else{
          alert("Invalid Date Range!");
      }
};

$("#generate").click(function(){

  var date1 = $('#date1').val();
  var date2 = $('#date2').val();

  var grandTotal = parseFloat($('#grandTotal').val()); // Konversi nilai grandTotal menjadi float

  var getData = "sum_total_stock.php?date1="+date1+"&date2="+date2;
  var totalStock = 0; // Variabel untuk menyimpan total stock
  $.get(getData, function( data ) {
    var total = parseFloat(data.total); // Konversi nilai total menjadi float
    totalStock = total; // Simpan total stock
    var totalItem = total;
    console.log(grandTotal += totalItem); // Tambahkan total stock ke grandTotal
    $('#totalItems').val(totalItem);
    totalItem = "Rp. "+totalItem.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")+",-";
    $('#totalItem').val(totalItem);
  }, "json" );

  var getDataIngre = "sum_total_ingredient.php?date1="+date1+"&date2="+date2;
  var totalIngredient = 0; // Variabel untuk menyimpan total ingredient
  $.get(getDataIngre, function( data ) {
    var total = parseFloat(data.total); // Konversi nilai total menjadi float
    totalIngredient = total; // Simpan total ingredient
    console.log(grandTotal += totalIngredient); // Tambahkan total ingredient ke grandTotal
    $('#totalIngres').val(total);
    total = "Rp. "+total.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")+",-";
    $('#totalIngre').val(total);
  }, "json" );

  // Setelah kedua permintaan selesai, lakukan total dari totalStock dan totalIngredient
  // dan tampilkan total keseluruhan
  $(document).ajaxStop(function() {
    var totalAll = totalStock + totalIngredient;
    console.log(totalAll); // Total keseluruhan
    totalAll = "Rp. "+totalAll.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")+",-";
    $('#grandTotal').val(totalAll); // Tampilkan total keseluruhan
  });
});

// $("#generate").click(function(){

//   var date1 = $('#date1').val();
//   var date2 = $('#date2').val();

//   var grandTotal = $('#grandTotal').val();

//   var getData = "sum_total_stock.php?date1="+date1+"&date2="+date2;
//   $.get(getData, function( data ) {
// 			var total = data.total;
      
//         var totalItem = total;
//         console.log(parseFloat(grandTotal+=totalItem));
        
//         $('#totalItems').val(totalItem);
//         totalItem = "Rp. "+totalItem.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")+",-";
//         $('#totalItem').val(totalItem);
        
// 		}, "json" );

//   var getDataIngre = "sum_total_ingredient.php?date1="+date1+"&date2="+date2;
//   $.get(getDataIngre, function( data ) {
// 			var total = data.total;

//         var totalIngre = total;
//         console.log(parseFloat(grandTotal+=totalIngre));
        
//         $('#totalIngres').val(totalIngre);
//         totalIngre = "Rp. "+totalIngre.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")+",-";
//         $('#totalIngre').val(totalIngre);
			
// 		}, "json" );


// });
    
var itemTableIng = $('#itemTableIngredient').DataTable(
    {
       
        processing : false,
        responsive : true,
        ajax: {
            url: "ingredient_data.php?date1="+"<?php echo date('Y-m-d');?>"+"&date2="+"<?php echo date('Y-m-d');?>",
            data: 'data'
        },
        columns: [
            { data: 'no' },
            { data: 'transDate' },
            { data: 'ingredient' },
            { data: 'measurementName' },
            { data: 'amount' },
            { data: 'itemAmount' },
            { data: 'totalPrice' },
            { data: 'discountPrice' },
            { data: 'afterDiscount' },
            { data: 'fullname' },
            { data: 'dateCreated' }
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
var itemTableStk = $('#itemTableStock').DataTable(
    {
       
        processing : false,
        responsive : true,
        ajax: {
            url: "stock_data.php?date1="+"<?php echo date('Y-m-d');?>"+"&date2="+"<?php echo date('Y-m-d');?>",
            data: 'data'
        },
        columns: [
            { data: 'no' },
            { data: 'transItemDate' },
            { data: 'stockName' },
            { data: 'measurementName' },
            { data: 'amountBuy' },
            { data: 'stockAmount' },
            { data: 'totalPrice' },
            { data: 'discountPrice' },
            { data: 'afterDiscount' },
            { data: 'fullname' },
            { data: 'dateCreated' }
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
