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
        <table id='searchDateBox2'>
          <tr>
              <input type='date' value="<?php echo date("Y-m-d");?>" id='dateA'/> - <input type='date' value="<?php echo date("Y-m-d");?>" id='dateB'/>
              <button type='button' id='searchDate2' class='btn btn-primary ml-1' style='font-size:10px;'>Search</button>
          </tr>
        </table>
      <div class="card">
      <div class='entry-box-basic'>
        <div class="card-header">
          <h4 align='center'>Chart Laporan Penjualan Kategori</h4>
        </div>
      <div class="row mb-3">
            <div class="col-lg-6 mt-5">
                <div style="width: 500px;margin: 0px auto;">
                  <h4><b class="text-primary">Quantity</b></h4>
                    <table id='searchDateBox2'>
                      <tr>
                        <input type='date' value="<?php echo date("Y-m-d");?>" id='dateA'/> - <input type='date' value="<?php echo date("Y-m-d");?>" id='dateB'/>
                        <button type='button' id='searchDate2' class='btn btn-primary ml-1' style='font-size:10px;'>Search</button>
                      </tr>
                    </table>
                   <canvas id="chartCategory"></canvas>
                </div>
            </div>

            <div class="col-lg-6 mt-5">
                <div style="width: 500px;margin: 0px auto;">
                  <h4><b class="text-primary">Total</b></h4>
                    <table id='searchDateBox3'>
                      <tr>
                        <input type='date' value="<?php echo date("Y-m-d");?>" id='dateA'/> - <input type='date' value="<?php echo date("Y-m-d");?>" id='dateB'/>
                        <button type='button' id='searchDate3' class='btn btn-primary ml-1' style='font-size:10px;'>Search</button>
                      </tr>
                    </table>
                   <canvas id="chartPrice"></canvas>
                </div>
            </div>
        </div>
      </div>

      <div class="row mb-2">

          <div class="col">
            <h1 class="m-0 text-dark text-center"></h1>
            <!-- <hr> -->
<!--             <table id='searchDateBox'>
              <tr>
                <input type='date' id='date1'/> - <input type='date' id='date2'/>
                <select class="ml-1 col-3" name="status" id="status">
                  <option value="">STATUS</option>
                  <option value="0">ALL</option>
                  <option value="1">SUCCESS</option>
                  <option value="9">CANCELED</option>
                </select>
                <button type='button' id='searchDate' class='btn btn-primary ml-1' style='font-size:10px;'>Search</button>
              </tr>
            </table> -->
          </div>
        </div>
      </div>
  </div>

<hr class="mt-4 mb-4">

      <div class="container-fluid">
        <div class="card">
          <div class="card-body">
            <h4 class="mb-3" align='center'>Detail Penjualan</h4>
      <?php 

      $today = date('Y-m-d');

      $query = mysql_query("SELECT c.categoryName FROM mcategory c
                            INNER JOIN mproduct p ON c.categoryID = p.categoryID
                            INNER JOIN taborderdetail d ON p.productID = d.productID
                            INNER JOIN taborderheader h ON h.orderID = d.orderID
                            WHERE h.orderDate = '$today' GROUP BY c.categoryID");
      while($res = mysql_fetch_array($query)){ 

      ?>
      
            <div class="card-header">
              <h4><?php echo $res['categoryName'] ?></h4>
            </div>        
              <table class='table' id="catpro<?php echo $res[categoryName] ?>" style='font-size:13px;'>
                <thead>
                  <tr>
                    <th style='vertical-align:middle;'>NO</th>
                    <th style='vertical-align:middle;'>PRODUCT NAME</th>
                    <th style='vertical-align:middle;'>JUMLAH</th>
                    <!-- <th style='vertical-align:middle;'>REMARKS</th> -->
                    <th style='vertical-align:middle;'>LAST UPDATED</th>
                    <!-- <th style='vertical-align:middle;'>ACTION</th> -->
                  </tr>
                </thead>
              </table>
            <?php } ?>
          </div>
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
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>
<script type="text/javascript" src="../../assets/plugins/chart.js/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
  var date1 = $("#date1").val('<?php echo date("Y-m-d");?>');
  var date2 = $("#date2").val('<?php echo date("Y-m-d");?>');
  var status = $("#status").val('');
  $("#searchDate").click(function(){searchDateJournal();}); 
  // alert('date1');
});
    

<?php 

  $query = mysql_query("SELECT * FROM mcategory WHERE status = 1");
  while($res = mysql_fetch_array($query)){
?>
var itemTable = $('#catpro<?php echo $res[categoryName] ?>').DataTable(
    {
       
        processing : false,
        responsive : true,
        ajax: {
            url: "categoryA.php?categoryID="+"<?php echo $res[categoryID] ?>",
            // url: "transaction_data.php?date1="+"<?php echo date('Y-m-d', strtotime("-1 month"));?>"+"&date2="+"<?php echo date('Y-m-d');?>"+"&status=0",
            data: 'data'
        },
        columns: [
            { data: 'no' },
            { data: 'productName' },
            { data: 'jumlah_pembelian' },
            // { data: 'remarks'},
            { data: 'lastChanged'}
        ],
    "columnDefs": [
        {"className": "dt-center", "targets": "_all"}
      ]
    }

        
);
  <?php } ?>

$.getJSON("http://localhost/picaPOS/admin/summaryCategory/category_list.php", function(data) {

    var isi_labels = [];
    var isi_data=[];

    $(data).each(function(i){         
        isi_labels.push(data[i].categoryName); 
        isi_data.push(data[i].jumlah_pembelian);
    });    
    console.log(isi_labels);
    console.log(isi_data);

    var ctx = chartProductCategories = document.getElementById('chartCategory').getContext('2d');

    var myChart = chartCategories = new Chart(ctx, {
        //chart akan ditampilkan sebagai bar chart
        type: 'pie',
        data: {
            //membuat label chart
            labels: isi_labels,
            datasets: [{
                label: 'Data Produk',
                //isi chart
                data: isi_data,
                //membuat warna pada bar chart
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

});

$('#searchDate2').click(function(e){
    var startDateA = new Date($('#dateA').val());
    var endDateA = new Date($('#dateB').val());
        if (startDateA <= endDateA){
        var urlS = "categories.php?dateA="+$("#dateA").val()+"&dateB="+$("#dateB").val();
        // itemTableCategory.ajax.url(urlS).load();

        var isi_labels = [];
        var isi_data = [];

        $.ajax(urlS, {
            dataType: 'JSON',
            success: function(data, status, jqxhr){
                var responseData = data.data

                responseData.forEach(function(element, index){
                    isi_labels.push(responseData[index].categoryName);
                    isi_data.push(responseData[index].totals);
                });

                chartCategories.chart.data.labels = isi_labels;
                chartCategories.chart.data.datasets[0].data = isi_data;
                chartCategories.update();
            }
        });

    }else{
        alert("Invalid Data Range!");
    }
});

$.getJSON("http://localhost/picaPOS/admin/summaryCategory/category_price.php", function(data) {

    var isi_labels = [];
    var isi_data=[];

    $(data).each(function(i){         
        isi_labels.push(data[i].categoryName); 
        isi_data.push(data[i].jumlah_pembelian);
    });    
    console.log(isi_labels);
    console.log(isi_data);

    var ctx = chartPrices = document.getElementById('chartPrice').getContext('2d');

    var myChart = chartPrices = new Chart(ctx, {
        //chart akan ditampilkan sebagai bar chart
        type: 'pie',
        data: {
            //membuat label chart
            labels: isi_labels,
            datasets: [{
                label: 'Data Produk',
                //isi chart
                data: isi_data,
                //membuat warna pada bar chart
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

});

$('#searchDate3').click(function(e){
    var startDateA = new Date($('#dateA').val());
    var endDateA = new Date($('#dateB').val());
        if (startDateA <= endDateA){
        var urlS = "prices.php?dateA="+$("#dateA").val()+"&dateB="+$("#dateB").val();
        // itemTableCategory.ajax.url(urlS).load();

        var isi_labels = [];
        var isi_data = [];

        $.ajax(urlS, {
            dataType: 'JSON',
            success: function(data, status, jqxhr){
                var responseData = data.data

                responseData.forEach(function(element, index){
                    isi_labels.push(responseData[index].categoryName);
                    isi_data.push(responseData[index].totals);
                });

                chartPrices.chart.data.labels = isi_labels;
                chartPrices.chart.data.datasets[0].data = isi_data;
                chartPrices.update();
            }
        });

    }else{
        alert("Invalid Data Range!");
    }
});

function searchDateJournal()
{
    var startDate = new Date($('#date1').val());
    var endDate = new Date($('#date2').val());
    var stat = $('#status').val();
      if (startDate <= endDate){
          var urlS = "transaction_data.php?date1="+$("#date1").val()+"&date2="+$("#date2").val()+"&status="+$("#status").val();
          itemTable.ajax.url(urlS).load();
      }else{
          alert("Invalid Date Range!");
      }
};

</script>

<script>
  $(window).load(function() { $(".se-pre-con").fadeOut("slow"); });  
</script>
<!-- AdminLTE App -->
<script src="../../asset/sdist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../../assets/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../assets/dist/js/demo.js"></script>
</body>
</html>
