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
    
    <!-- Newer JQuery one already in below, is this still be used? -->
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" type="text/css" href="../new-asset/css/style.css">
    <link rel="stylesheet" type="text/css" href="../new-asset/css/styles.css">
    <link rel="stylesheet" type="text/css" href="../new-asset/css/menu_def_style.css">
    <link rel="stylesheet" type="text/css" href="../new-asset/css/comon.css">  

</head>

<body bgcolor="#f9f6f1"> 
<div class="se-pre-con"></div>

<?php
echo "<div class='top-panel'>
          <div class='clear height-20'></div>
          <div class='clear height-40 margin-left-20'><img src='../new-asset/images/logo-header.png' width='291' height='28'></div>";	
include('../libs/header.php');

if($_GET['idItem']==""){
    $queryItemID = "SELECT count(idItem)+1 as idItem FROM mStock";
    $resItemID = mssql_query($queryItemID);
    $row = mssql_fetch_array($resItemID);
    $idItem = $row['idItem'];
}else{
    $idItem = $_GET['idItem'];
    $query = "SELECT * FROM mStock WHERE idItem ='".$idItem."'";
    $res = mssql_query($query);
    $row = mssql_fetch_array($res);
}
    
echo "</div>

      <div class='container'>
          <div class='clear height-10'></div>
          
          <table style='width:100%;border:1px solid #E1E1E1;height:40px;'>
          <tr>
              <td style='font-size:16px'>&nbsp;DepotManager | <strong> ADD/EDIT ITEM  </strong></td>
              <td style='text-align:right;'>&nbsp;</strong></td>
          </tr>
          </table>

          <div class='height-10'></div>
          
          <div class='entry-box-basic'>
                <h1>
                    ADD/EDIT ITEM";
                if($_GET['idItem']!=""){
echo"                    <button type='button' id='del' class='fa fa-trash' style='float: right;margin-top:13px;font-size:13px;'></button>";
                    
                }
echo "          </h1>
                <form id='formAdd' method='POST' action='item_process.php'>
                    <table>
                        <tr>
                            <td>
                                  <input type='hidden' class='type-input' name='idItem' value='$idItem'/>
                            </td>
                        </tr>
                        <tr>
                            <td>CATEGORY</td>
                            <td>:&nbsp;</td>
                            <td>
                                <select class='select-cust' name='category' style='width:173px;' required>";
                            
                                $queryCategory="select * from mStockCategory where status != 0";
                                $resCategory=mssql_query($queryCategory);
                                while($rowCategory=mssql_fetch_array($resCategory)){
                                    if($rowCategory[idCategory] == $row[category]){
                                        echo "<option selected value='$rowCategory[idCategory]'>$rowCategory[category]</option>";
                                    }else{
                                        echo "<option value='$rowCategory[idCategory]'>$rowCategory[category]</option>"; 
                                    }
                                }
echo                        "   </select>
                            </td>
                            <td>&emsp;&emsp;&emsp;&emsp;</td>
                            <td>LOCATION</td>
                            <td>:&nbsp;</td>
                            <td>
                                <select class='select-cust' name='location' style='width:173px;' required>";
                            
                                $queryLocation="select * from mStockLocation where status != 0";
                                $resLocation=mssql_query($queryLocation);
                                while($rowLocation=mssql_fetch_array($resLocation)){
                                    if($rowLocation[idLocation] == $row[location]){
                                        echo "<option selected value='$rowLocation[idLocation]'>$rowLocation[location]</option>";
                                    }else{
                                        echo "<option value='$rowLocation[idLocation]'>$rowLocation[location]</option>"; 
                                    }
                                }
echo                        "   </select>
                            </td>
                        </tr>
                        <tr>
                            <td>ITEM NAME</td>
                            <td>:&nbsp;</td>
                            <td>
                                  <input type='text' class='type-input' name='itemName' value='$row[itemName]' required />
                                  
                            </td>
                            
                            <td>&emsp;&emsp;&emsp;&emsp;</td>
                            <td>MEASUREMENT</td>
                            <td>:&nbsp;</td>
                            <td>
                                <select class='select-cust' name='measurement' style='width:173px;' required>";
                            
                                $queryMeasurement="select * from mStockMeasurement where status != 0";
                                $resMeasurement=mssql_query($queryMeasurement);
                                while($rowMeasurement=mssql_fetch_array($resMeasurement)){
                                    if($rowMeasurement[idMeasurement] == $row[measurement]){
                                        echo "<option selected value='$rowMeasurement[idMeasurement]'>$rowMeasurement[measurement]</option>";
                                    }else{
                                        echo "<option value='$rowMeasurement[idMeasurement]'>$rowMeasurement[measurement]</option>";
                                    }

                                }
echo                        "   </select>
                            </td>
                            <td>&emsp;&emsp;&emsp;&emsp;</td>
                            <td>ITEM CONDITION</td>
                            <td>:&nbsp;</td>
                            <td>
                                <select class='select-cust' name='condition' style='width:173px;' required>";
                            
                                $queryCondition="select * from mStockCondition where status != 0";
                                $resCondition=mssql_query($queryCondition);
                                while($rowCondition=mssql_fetch_array($resCondition)){
                                    if($rowCondition[idCondition] == $row[condition]){
                                        echo "<option selected value='$rowCondition[idCondition]'>$rowCondition[condition]</option>";
                                    }else{
                                        echo "<option value='$rowCondition[idCondition]'>$rowCondition[condition]</option>";
                                    }

                                }
echo                        "   </select>
                            </td>
                        </tr>
                        <tr>
                            <td>MINIMUM AMOUNT</td>
                            <td>:&nbsp;</td>
                            <td>
                                  <input type='text' class='type-input' name='minStock' value='$row[minStock]' required/>
                            </td>
                        </tr>
                        <tr class='inputButton'>
                            <td>
                                <input id='save' type='submit' value='SAVE' class='btn btn-primary' style='font-size:10px;'/>
                                <button type='button' id='cancel' class='btn btn-danger' style='font-size:10px;'>CANCEL</button>
                            </td>
                        </tr>
                        <tr><td>&nbsp;</td></tr>
                        <tr><td>&nbsp;</td></tr>
                    </table>
                </form>
            </div>

          <div class='height-15'>
            
          </div>
     </div>
     </div>
     <br/>";

include("../libs/footer.php");  
?>
  
</body>
</html>

<?php
  }
?>

<script type="text/javascript">
    $(document).ready(function(){  
        
    });
    
    $("#cancel").click(function(){
        alert("Data tidak tersimpan");
        location.replace('/app/wh-item/');
    });
    $("#del").click(function(){
        var r = confirm("Apakah yakin ingin menghapus data ini?");
        if(r){
            <?php echo "location.replace('/app/wh-item/item_delete.php?idItem=$idItem');"?>
        }
    });
    
</script>

<script>
  $(window).load(function() { $(".se-pre-con").fadeOut("slow");	});  
</script>