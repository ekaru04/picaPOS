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
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div>
    <div class='clear height-20 mt-3'></div>
    <div class="container-fluid">
      <div class='entry-box-basic'>
      <h4 align='center'>MEASUREMENTS</h4>
      <div class="row mb-2">
          <div class="col">
            <h1 class="m-0 text-dark text-center"></h1>
            <hr>
            
          </div>
          <div class="">
            <!-- <button type='button' id='addStock' class='btn btn-primary mr-1' style='float: right;margin-top:13px; font-size:13px;'>ADD CURRENT STOCK</button> -->
            <button type='button' id='add' class='btn btn-primary' style='float: right;margin-top:13px; font-size:13px;'>ADD NEW MEASUREMENTS</button>
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
              <th style='vertical-align:middle;'>MEASUREMENT</th>
              <th style='vertical-align:middle;'>MEASUREMENT CODE</th>
              <th style='vertical-align:middle;'>REMARKS</th>
              <th style='vertical-align:middle;'>STATUS</th>
              <th style='vertical-align:middle;'>LAST UPDATED</th>
              <th style='vertical-align:middle;'>ACTION</th>
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
<script type="text/javascript">
    
var itemTable = $('#itemTable').DataTable(
    {
       
        processing : false,
        responsive : true,
        ajax: {
            url: "measurement_data.php",
            data: 'data'
        },
        columns: [
            { data: 'no' },
            { data: 'measurementName' },
            { data: 'measurementCode' },
            { data: 'remarks' },
            { data: 'status' },
            { data: 'lastChanged' },
            { data: 'action'}
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
    location.replace('measurement_input.php');
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
