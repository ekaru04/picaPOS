<?php
session_start();

if (!isset($_SESSION["userName"])) 
{
    $URL="/app/"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
} 

else 
{  
    include("../libs/db.php");
?>

<!DOCTYPE html>
<html>
<head>  
    <meta charset="utf-8"> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1' name='viewport'/>
    
    <title>Depotmanager</title>
    <link rel="shortcut icon" href="../office.png" type="image/x-icon" />
    
    <!-- Adding bootstrap -->
    <link rel="stylesheet" href="libs/bootstrap-4.5.3-dist/css/bootstrap.min.css"/>
    
    <script src="../new-asset/js/jquery-1.11.3.min.js"></script>
    <script src="libs/bootstrap-4.5.3-dist/js/bootstrap.min.js"></script>
    
    <style>
    @media only screen and (max-width: 760px),
    (min-device-width: 768px) and (max-device-width: 1024px)  
    {
        
        
        
        #mytable td, #mytable tr 
        {
            display: block;
            text-align:left;
            font-size:13px;
        }
        
        #mytable tr 
        {
            border: none;
        }
        
        #mytable td 
        {
            border: none;
            border-bottom: 1px solid #eee;
        }
        
        #mytable td:before 
        {
            position: absolute;
            top: 6px;left:6px;
            padding-right: 10px;
            white-space: nowrap;
        }
        
        .inactiveUser
        {
            background-color: rgba(255,0,0,0.5);
        }
        
    }

    /* Smartphones (portrait and landscape) ----------- */
    @media only screen
    and (min-device-width : 320px)
    and (max-device-width : 480px) 
    {
        body 
        {
            padding: 0;
            margin: 0;
            width: 320px; 
        }
    }

    /* iPads (portrait and landscape) ----------- */
    @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) 
    {
        body 
        {
            width: 495px;
        }
    }
    </style>   

    <script src="../new-asset/js/jquery-2.2.4.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous"> 
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" type="text/css" href="../new-asset/css/style.css">
    <link rel="stylesheet" type="text/css" href="../new-asset/css/styles.css">
    <link rel="stylesheet" type="text/css" href="../new-asset/css/menu_def_style.css">
    <link rel="stylesheet" type="text/css" href="../new-asset/css/comon.css">  
    
    <!-- datatables -->
    <link rel="stylesheet" type="text/css" href="libs/DataTables/datatables.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.7.1/css/buttons.dataTables.min.css"/>
    
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.7.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.7.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.7.1/js/buttons.print.min.js"></script>

</head>

<body bgcolor="#f9f6f1"> 
<div class="se-pre-con"></div>

<?php
echo "<div class='top-panel'>
          <div class='clear height-20'></div>
          <div class='clear height-40 margin-left-20'><img src='../new-asset/images/logo-header.png' width='291' height='28'></div>";	
include('../libs/header.php');

$idItem = $_GET['idItem'];
    $query = "SELECT s.*,l.location as loc FROM mStock s INNER JOIN mStockLocation l ON s.location = l.idLocation WHERE idItem ='".$idItem."'";
    $res = mssql_query($query);
    $row = mssql_fetch_array($res);
    
    
echo "</div>

      <div class='container'>
          <div class='clear height-10'></div>
          
          <table style='width:100%;border:1px solid #E1E1E1;height:40px;'>
          <tr>
              <td style='font-size:16px'>&nbsp;DepotManager | <strong><a href='?folder=mgritem' style='text-decoration:none;color:black;font-weight:bold;'>STOCK ITEM</a> | ITEM HISTORY | ".strtoupper($row[itemName])." (".strtoupper($row[loc]).") </strong></td>
          </tr>
          </table>

          <div class='height-10'></div>
          
            <div class='entry-box-basic'>
                <h1 align='center'>ITEM HISTORY</h1>
                <table class='table' id='itemTable' style='font-size:13px;'>
                    <thead>
                        <tr>
                            <th style='vertical-align:middle;'>NO</th>
                            <th style='vertical-align:middle;'>DATE</th>
                            <th style='vertical-align:middle;'>IN</th>
                            <th style='vertical-align:middle;'>OUT</th>
                            <th style='vertical-align:middle;'>STOCK</th>
                            <th style='vertical-align:middle;'>MEASUREMENT</th>
                            <th style='vertical-align:middle;'>PIC</th>
                            <th style='vertical-align:middle;'>USER</th>
                            <th style='vertical-align:middle;'>REMARKS</th>
                            <th style='vertical-align:middle;'>REF. NUMBER</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    </tbody>
                </table>

                <div class='height-15'></div>
                <div>
            
                </div>
      </div>";

include("../libs/footer.php");  
?>
  
</body>
</html>

<?php
  }
?>

<script type="text/javascript">
    
var itemTable = $('#itemTable').DataTable(
    {
        processing : false,
        responsive : true,
        
        ajax: {
            url: "item_history_data.php?idItem=<?php echo $row[idItem];?>",
            data: 'data'
        },
        columns: [
            { data: 'no' },
            { data: 'date' },
            { data: 'in' },
            { data: 'out' },
            { data: 'stock' },
            { data: 'measurement' },
            { data: 'pic' },
            { data: 'fullName' },
            { data: 'remarks' },
            { data: 'referenceNum' }
        ],
        dom: "<'row'<'col-sm-12'B>>"+
                "<'row'<'col-sm-6'l><'col-sm-6'f>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-5'i><'col-sm-7'p>>",
        buttons: [
            {
                extend: 'excel',
                text: 'Excel',
                filename: '<?php echo strtoupper($row[loc])." ".strtoupper($row[itemName]);?> STOCK HISTORY <?php echo date("Ymd");?>',
                title: '<?php echo strtoupper($row[loc])." ".strtoupper($row[itemName]);?> STOCK HISTORY',
                exportOptions: {
                    modifier: {
                        page: 'all'
                    }
                }
            }
        ]
    }
        
);
    
</script>

<script>
  $(window).load(function() { $(".se-pre-con").fadeOut("slow");	});  
</script>