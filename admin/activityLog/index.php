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
      <div class='row'>
        <div class='col-lg-8'>
          <div class='entry-box-basic'>
          <h4 align='center'>ACTIVITY LOG</h4>
  <div class="row mb-2">
    <div class="col">
      <h1 class="m-0 text-dark text-center"></h1>
      <hr>
      <table id='searchDateBox'>
        <tr>
          <input type='date' id='date1'/> - <input type='date' id='date2'/>
            <select class="ml-1 col-3" name="status" id="status">
              <option value="">STATUS</option>
              <option value="0">ALL</option>
              <option value="1">SUCCESS</option>
              <option value="9">FAILED</option>
            </select>
          <button type='button' id='searchDate' class='btn btn-primary ml-1' style='font-size:10px;'>Search</button>
        </tr>
      </table>
    </div>
    <div class='height-15'></div>
    </div>
          <div class='height-10'></div>
            <table class='table' id='itemTable' style='font-size:13px;'>
              <thead>
                <tr>
                  <th style='vertical-align:middle;'>JOURNAL ID</th>
                  <th style='vertical-align:middle;'>ACTIVITY</th>
                  <th style='vertical-align:middle;'>MENU</th>
                  <th style='vertical-align:middle;'>PIC</th>
                  <th style='vertical-align:middle;'>ACTIVITY DATE</th>
                  <th style='vertical-align:middle;'>STATUS</th>
                </tr>
              </thead>
              <tbody>

              </tbody>
            </table>
          </div>          
        </div>
        <div class='col-lg-4'>
          <div class='entry-box-basic'>
          <h4 align='center'>ACTIVITY LOG</h4>
          <div class='height-10'></div>
            <table class='table' id='itemTable' style='font-size:13px;'>
              <thead>
                <tr>
                  <th style='vertical-align:middle;'>JOURNAL ID</th>
                  <th style='vertical-align:middle;'>ACTIVITY</th>
                  <th style='vertical-align:middle;'>MENU</th>
                  <th style='vertical-align:middle;'>PIC</th>
                  <th style='vertical-align:middle;'>ACTIVITY DATE</th>
                  <th style='vertical-align:middle;'>STATUS</th>
                </tr>
              </thead>
              <tbody>

              </tbody>
            </table>
          </div>  
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
  // alert('date1');
});
    
var itemTable = $('#itemTable').DataTable(
    {
       
        processing : false,
        responsive : true,
        ajax: {
            url: "activity_data.php",
            data: 'data'
        },
        columns: [
            // { data: 'no' },
            { data: 'journalID' },
            { data: 'activity' },
            { data: 'menu' },
            { data: 'userID' },
            { data: 'logCreated' },
            { data: 'status' }
        ],
    "columnDefs": [
        {"className": "dt-center", "targets": "_all"}
      ],
      dom: 'Bfrtip',
        buttons: [
            {
                extend: 'excelHtml5',
                exportOptions: {
                    columns: [ 0, 1, 2, 3, 4, 5, 6]
                }
            },
            {
                extend: 'pdfHtml5',
                exportOptions: {
                    columns: [ 0, 1, 2, 3, 4, 5, 6]
                }
            }
        ]
        
    }
        
);
    
function excel(){
    location.href='item_list_xls.php';
}
    
$("#add").click(function(){
    location.replace('outlet_input.php');
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
