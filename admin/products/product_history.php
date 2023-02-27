<?php 
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
} 
      include('../../assets/template/navbar.php');
      include('../../assets/config/db.php');

$productID = $_GET[productID];

$res = mysql_query("SELECT * FROM mproduct WHERE productID = '$productID' AND status = 1");
$row = mysql_fetch_array($res);

?>
  </aside>

  <div>
    <div class='clear height-20 mt-3'></div>
    <div class="container-fluid">
      <div class='entry-box-basic'>
      <h4 align='center'>
        <span style='float:left;'>
        <a href='/picaPOS/admin/products' style='text-decoration:none;color:black;'><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
</svg>
      </a> 
      </span>PRODUCTS HISTORY <?php echo $row[productName];?></h4>
      <div class="row mb-2">
          <div class="col">
            <h1 class="m-0 text-dark text-center"></h1>
            <hr>
            
          </div>
          <div class="">
          </a>
          </div>
          <div class="col">
            <h1 class="m-0 text-dark text-center"></h1>
            <hr>
          </div>
        </div>
      <div class='height-10'></div>
        <table class='table' id='itemTable' style='font-size:13px;'>
          <thead>
            <tr>
              <th style='vertical-align:middle;'>NO</th>
              <th style='vertical-align:middle;'>TRANSACTION TYPE</th>
              <th style='vertical-align:middle;'>INGREDIENT</th>
              <th style='vertical-align:middle;'>AMOUNT</th>
              <th style='vertical-align:middle;'>STOCK</th>
              <th style='vertical-align:middle;'>MEASUREMENT</th>
              <th style='vertical-align:middle;'>PIC</th>
              <th style='vertical-align:middle;'>REMARKS</th>
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
            url: "history_data.php?productID=<?php echo $_GET[productID];?>",
            data: 'data'
        },
        columns: [
            { data: 'no' },
            { data: 'transType' },
            { data: 'productName' },
            { data: 'amount' },
            { data: 'itemAmount' },
            { data: 'measurementName' },
            { data: 'fullname' },
            { data: 'remarks' },
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
                    columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8 ]
                }
            },
            {
                extend: 'pdfHtml5',
                exportOptions: {
                    columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8 ]
                }
            }
        ]
        
    }
        
);
    
function excel(){
    location.href='item_list_xls.php';
}
    
$("#add").click(function(){
    location.replace('ingredient_input.php');
});
$("#addStock").click(function(){
    location.replace('ingredient_addStock.php');
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
