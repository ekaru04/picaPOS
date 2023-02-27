<?php 
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
} 
include('../../assets/template/navbar.php');
include('../../assets/config/db.php'); 

$today = date('Y-m-d');
$yesterday = date('Y-m-d', strtotime('-1 days'));

$query = mysql_query("SELECT SUM(p.total) AS total, h.orderDate from tabpaymentorder p INNER JOIN taborderheader h ON h.orderID = p.orderID WHERE h.orderDate = '$today'");
$resQ = mysql_fetch_array($query);
$totalIncome = "Rp. ".number_format($resQ["total"]);

$queryQY = mysql_query("SELECT SUM(p.total) AS total, h.orderDate from tabpaymentorder p INNER JOIN taborderheader h ON h.orderID = p.orderID WHERE h.orderDate = '$yesterday'");
$resQY = mysql_fetch_array($queryQY);
$totalIncomeQY = "Rp. ".number_format($resQY["total"]);

$queryTrx = mysql_query("SELECT COUNT(p.total) AS total, h.orderDate from tabpaymentorder p INNER JOIN taborderheader h ON h.orderID = p.orderID WHERE h.orderDate = '$today'");
$resT = mysql_fetch_array($queryTrx);

$queryTrx2 = mysql_query("SELECT COUNT(p.total) AS total, h.orderDate from tabpaymentorder p INNER JOIN taborderheader h ON h.orderID = p.orderID WHERE h.orderDate = '$yesterday'");
$resT2 = mysql_fetch_array($queryTrx2);

$queryCust = mysql_query("SELECT COUNT(customerID) AS customer FROM mcustomer");
$resC = mysql_fetch_array($queryCust);

$queryNewc = mysql_query("SELECT COUNT(customerID) AS customer FROM mcustomer WHERE dateCreated = '$today'");
$resN = mysql_fetch_array($queryNewc);

?>

    <div class="container-fluid">

        <div class="row mt-5">
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body">
                      <h4 class="text-primary"><b>Total Penjualan</b></h4>
                      <p>Hari Ini</p>
                      <h4 class="card-text">IDR <?php echo $totalIncome; ?></h4>
                      <hr>
                      <p>Kemarin</p>
                      <h4 class="card-text">IDR <?php echo $totalIncomeQY; ?></h4>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body">
                      <h4 class="text-primary"><b>Total Transaksi</b></h4>
                      <p>Hari Ini</p>
                      <h4 class="card-text"><?php echo $resT[total]; ?></h4>
                      <hr>
                      <p>Kemarin</p>
                      <h4 class="card-text"><?php echo $resT2[total]; ?></h4>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-4">
                <div class="card">
                    <div class="card-body">
                    <h4 class="text-primary"><b>Total Customers</b></h4>
                    <p class="card-text ml-2"><?php echo $resC[customer]; ?></p>
                    <hr>
                    <h4 class="text-primary"><b>Customer Baru</b></h4>
                    <p class="card-text ml-2"><?php echo $resN[customer]; ?></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col mt-5">
                <div style="width: 500px;margin: 0px auto;">
                  <h4><b><a href="#">Summary Penjualan Produk</a></b></h4>
                    <table id='searchDateBox' class="mb-1">
                      <tr>
                        <input type='date' value="<?php echo date("Y-m-d");?>" id='date1'/> - <input type='date' value="<?php echo date("Y-m-d");?>" id='date2'/>
                        <button type='button' id='searchDate' class='btn btn-primary ml-1' style='font-size:10px;'>Search</button>
                      </tr>
                    </table>
                   <canvas id="chartProduct"></canvas>
                </div>                    
            </div>
            <div class="col mt-5">
                <div style="width: 500px;margin: 0px auto;">
                  <h4><b><a href="../summaryCategory">Summary Penjualan Kategori Produk</a></b></h4>
                    <table id='searchDateBox2'>
                      <tr>
                        <input type='date' value="<?php echo date("Y-m-d");?>" id='dateA'/> - <input type='date' value="<?php echo date("Y-m-d");?>" id='dateB'/>
                        <button type='button' id='searchDate2' class='btn btn-primary ml-1' style='font-size:10px;'>Search</button>
                      </tr>
                    </table>
                   <canvas id="chartCategory"></canvas>
                </div>
            </div>

           <!--  <div class="col-12 mt-5">
                <div style="width: 500px;margin: 0px auto;">
                  <h4><b><a href="#">Category Product</a></b></h4>
                    <table id='searchDateBox' class="mb-1">
                      <tr>
                        <input type='date' value="<?php echo date("Y-m-d");?>" id='date1'/> - <input type='date' value="<?php echo date("Y-m-d");?>" id='date2'/>
                        <button type='button' id='searchDateCat' class='btn btn-primary ml-1' style='font-size:10px;'>Search</button>
                      </tr>
                    </table>
                   <canvas id="chartCatPro"></canvas>
                </div> 
            </div> -->
        </div>

        <div class="row">
            

            
        </div>
    </div>

    




<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script> -->
<script type="text/javascript" src="../../assets/plugins/chart.js/Chart.min.js"></script>

<script type="text/javascript">
    var chartProducts, chartCategories;
//     var itemTableProduct = $('#itemTableProduct').DataTable(
//     {
       
//         processing : false,
//         responsive : true,
//         ajax: {
//             url: "products.php",
//             data: 'data'
//         },
//         columns: [
//             { data: 'no' },
//             { data: 'productName' },
//             { data: 'totals' }
//         ],
//     "columnDefs": [
//         {"className": "dt-center", "targets": "_all"}
//       ],
//       dom: 'Bfrtip',
//         buttons: [
//             {
//                 extend: 'excelHtml5',
//                 exportOptions: {
//                     columns: [ 0, 1, 2, 3, 4, 5 ]
//                 }
//             },
//             {
//                 extend: 'pdfHtml5',
//                 exportOptions: {
//                     columns: [ 0, 1, 2, 3, 4, 5 ]
//                 }
//             }
//         ]
        
//     }
        
// );
//     var itemTableCategory = $('#itemTableCategory').DataTable(
//     {
       
//         processing : false,
//         responsive : true,
//         ajax: {
//             url: "categories.php",
//             data: 'data'
//         },
//         columns: [
//             { data: 'no' },
//             { data: 'categoryName' },
//             { data: 'totals' }
//         ],
//     "columnDefs": [
//         {"className": "dt-center", "targets": "_all"}
//       ],
//       dom: 'Bfrtip',
//         buttons: [
//             {
//                 extend: 'excelHtml5',
//                 exportOptions: {
//                     columns: [ 0, 1, 2, 3, 4, 5 ]
//                 }
//             },
//             {
//                 extend: 'pdfHtml5',
//                 exportOptions: {
//                     columns: [ 0, 1, 2, 3, 4, 5 ]
//                 }
//             }
//         ]
        
//     }
        
// );
</script>

<script>
    var chartProducts, chartCategories;
    $.getJSON("http://localhost/picaPOS/admin/dashboard/product_list.php", function(data) {

    var isi_labels = [];
    var isi_data = [];

    $(data).each(function(i){         
        isi_labels.push(data[i].productName); 
        isi_data.push(data[i].jumlah_pembelian);
    });    
    console.log(isi_labels);
    console.log(isi_data);

    var ctx = document.getElementById('chartProduct').getContext('2d');

    var myChart = chartProducts = new Chart(ctx, {
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


$.getJSON("http://localhost/picaPOS/admin/dashboard/category_list.php", function(data) {

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

$('#searchDate').click(function(e){
    var startDate = new Date($('#date1').val());
    var endDate = new Date($('#date2').val());
    var stat = $('#status').val();
        if (startDate <= endDate){
        var urlS = "products.php?date1="+$("#date1").val()+"&date2="+$("#date2").val();
        // itemTableProduct.ajax.url(urlS).load();

        var isi_labels = [];
        var isi_data = [];

        $.ajax(urlS, {
            dataType: 'JSON',
            success: function(data, status, jqxhr){
                var responseData = data.data

                responseData.forEach(function(element, index){
                    isi_labels.push(responseData[index].productName);
                    isi_data.push(responseData[index].totals);
                });

                chartProducts.chart.data.labels = isi_labels;
                chartProducts.chart.data.datasets[0].data = isi_data;
                chartProducts.update();
            }
        });
    }else{
        alert("Invalid Data Range!");
    }
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
</script>