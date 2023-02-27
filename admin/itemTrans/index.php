<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");      
include('../../assets/template/navbar.php');

if($_GET['id']==""){
    $queryItemID = "SELECT count(id)+1 as id FROM tabstocktransaction";
    $resItemID = mysql_query($queryItemID);
    $row = mysql_fetch_array($resItemID);
    $id = $row['id'];
}else{
    $id = $_GET['id'];
    $query = "SELECT * FROM tabstocktransaction WHERE id ='$id'";
    $res = mysql_query($query);
    $row = mysql_fetch_array($res);
}
?>

<style type="text/css">
    #showPrice{
        display:none;
    }
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<div>
       <div class='clear height-20 mt-3'></div>
        <div class="container-fluid">
         <div class='entry-box-basic'>
           <h1 class="text-center">
               <a href='/picaPOS/admin/pengeluaran' style='text-decoration:none;color:black;'><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
      <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
    </svg>
                        IN/OUT ITEMS
                    </a>
           </h1>
          <div class="container-fluid">
           <div class="row">
            <div class="col-8">
                <form id='formAdd' method='POST' action='stock_process.php' enctype="multipart/form-data">
                        <div class='col-3 label'>
                           <input type='text' class='form-control-plaintext' name="id" value='<?php echo $row[id]; ?>' />
                        </div>
                    <div class='row  mt-3 '>
                        
                        <div class='col-3 label'>
                           <input type='text' class='form-control-plaintext' disabled value='TYPE' />
                        </div>
                        <div class='col-3'>
                            <select class='select-cust form-control' name='type' id="type" style='width:300px;' required>
                                <!-- <option value="">--CHOOSE TYPE--</option> -->
                                <option id="IN" value='IN'>IN</option>
                                <option id="OUT" value='OUT'>OUT</option>
                            </select>
                        </div>
                    </div>

                    <div class='row  mt-3 '>
                        <div class='col-3 label'>
                           <input type='text' class='form-control-plaintext' disabled value='OUTLET' />
                        </div>
                        <div class='col-3'>
                            <select class='select-cust form-control' name='outletID' id='outletID' style='width:300px;' required>
                                <option value=''>-CHOOSE ONE-</option>
                                <?php
                                    $queryOutlet="SELECT * FROM moutlet WHERE status != 0";
                                    $resOutlet=mysql_query($queryOutlet);
                                    while($rowOutlet=mysql_fetch_array($resOutlet)){
                                        if($rowOutlet[outletID] == $_SESSION[outletID]){
                                            echo "<option selected value='$rowOutlet[outletID]'>$rowOutlet[outletName]</option>";
                                        }else{
                                            echo "<option value='$rowOutlet[outletID]'>$rowOutlet[outletName]</option>";
                                        }

                                    }
                                ?>
                            </select>
                        </div>
                    </div>

                    <div class='row mt-3'>
                        <div class='col-3 label'>
                           <input type='text' class='form-control-plaintext' disabled value='CATEGORY' />
                        </div>
                        <select class='select-cust ml-3 form-control' name='categoryStockID' id='categoryStockID' style='width:300px;' required>
                                <option value=''>-CHOOSE ONE-</option>
                                <?php
                                    $queryCategory="SELECT * FROM mstockcategory WHERE status != 0";
                                    $resCategory=mysql_query($queryCategory);
                                    while($rowCategory=mysql_fetch_array($resCategory)){
                                        if($rowCategory[categoryStockID] == $row[categoryStockID]){
                                            echo "<option selected value='$rowCategory[categoryStockID]'>$rowCategory[categoryStockName]</option>";
                                        }else{
                                            echo "<option value='$rowCategory[categoryStockID]'>$rowCategory[categoryStockName]</option>";
                                        }

                                    }
                                ?>
                            </select>
                    </div>   

                    <div class='row mt-3'>
                        <div class='col-3 label'>
                           <input type='text' class='form-control-plaintext' disabled value='ITEM' />
                        </div>
                        <select class='select-cust ml-3 form-control' name='stockID' id='stockID' style='width:300px;' selected>
                            <option value=''>-CHOOSE ONE-</option>
                            <?php
                              $queryProduct="SELECT * FROM mstock WHERE status != 0";
                              $resProduct=mysql_query($queryProduct);
                               while($rowProduct=mysql_fetch_array($resProduct)){
                                if($rowProduct[stockID] == $row[stockID]){
                                 echo "<option selected value='$rowProduct[stockID]'>$rowProduct[stockName]</option>";
                                }else{
                                 echo "<option value='$rowProduct[stockID]'>$rowProduct[stockName]</option>";
                                }
                              }
                            ?>
                        </select>
                    </div>                  

                    <div class='row mt-3'>
                        <div class='col-3 label'>
                           <input type='text' class='form-control-plaintext' disabled value='AMOUNT' />
                        </div>
                        <div class='col-2'>
                            <input type='text' class='type-input form-control' name='amount' placeholder='Amount' value="<?php echo $row[amount] ?>" style='width:300px' required />
                        </div>
                    </div>

                    <div class='row mt-3'>
                        <div class='col-3 label'>
                           <input type='text' class='form-control-plaintext' disabled value='PIC' />
                        </div>
                        <div class='col-2'>
                            <input type='text' class='type-input form-control' name='pic' placeholder='Person In Charge' value="<?php echo $row[pic]; ?>" style='width:300px' required />
                        </div>
                    </div>

                    <div id="showPrice">
                        <div class='row mt-3' >
                            <div class='col-3 label'>
                                <input type='text' class='form-control-plaintext' disabled value='PRICE' />
                            </div>
                            <div class='col-2'>
                                <input type='text' class='type-input form-control' name='price' placeholder='Price Product' style='width:300px' value='<?php echo $row[price] ?>' />
                            </div>
                        </div>
                    

                        <div class='row mt-3'>
                            <div class='col-3 label'>
                                <input type='text' class='form-control-plaintext' disabled value='UPLOAD PHOTO' />
                            </div>
                            <div class='col-3'>
                                <?php 
                                    if($row['photoName']!=null){
                                      echo  "<input type='file' class='type-input' name='fileUpload' style='width:300px' />";
                                      echo $row[photoName];
                                    }else{
                                        echo "<input type='file' class='type-input' name='fileUpload' style='width:300px'/>";
                                    }
                                ?>
                            </div>
                        </div>
                    </div>

                    <div class='row  mt-3'>
                        <div class='col-3 label'>
                           <input type='text' class='form-control-plaintext' disabled value='REMARKS' />
                        </div>
                        <div class='col-3'>
                            <textarea class='type-input form-control' name='remarks' placeholder='Insert notes here' rows='4' cols='50'></textarea>
                        </div>
                    </div>
                    
                    <div class='row  mt-3'>
                        <div class='col-3'>
                            <input id='save' type='submit' value='SUBMIT' name='submit' class='btn btn-success' />
                            <button type='button' id='cancel' class='btn btn-danger' >CANCEL</button>  
                        </div>
                    </div>
                    
                </form>
                            
                    </div>
                    <div class="row">
                    <?php
                        if($row['photoName']!=null):
                    ?>
                        <div class="col-4">
                            <div class="card" style="width: 18rem;">
                                <img class="card-img-top" src="<?php echo "../../receiptImages/".$row[photoName]; ?>">
                                <div class="card-body">
                                <p class="card-text"><?php echo $row[photoName]; ?></p>
                                </div>
                            </div>
                        </div>
                    <?php
                        else:
                    ?>
                    <div class="col-4">

                    </div>
                    <?php endif; ?> 
                </div>  
                  </div>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>
<script src=”https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js”></script>
<script type="text/javascript">

    $(document).ready(function(){
        var elem = document.getElementById("type");
        elem.onchange = function(){
            var hiddenDiv = document.getElementById("showPrice");
            hiddenDiv.style.display = (this.value == "OUT") ? "none":"block";
        };
    });
    
    $("#cancel").click(function(){
        alert("Data tidak tersimpan");
        location.replace('/picaPOS/admin/itemTrans/');
    });
    
    $("#del").click(function(){
        var r = confirm("Apakah yakin ingin menghapus data ini?");
        if(r){
            <?php echo "location.replace('itemTrans_delete.php?stockID=$stockID');"?>
        }
    });

    $(document).on('change','#categoryStockID',function(){
        var val = $('#categoryStockID').val();
        var val2 = $('#outletID').val();
        $.ajax({
            url: 'stock_list.php',
            data: {categoryStockID:val,outletID:val2},
            type: 'GET',
            dataType: 'html',
            success: function(result){
                $('#stockID').html(); 
                $('#stockID').html(result); 
            }
        });  
    });
    
</script>

<script>
  $(window).load(function() { $(".se-pre-con").fadeOut("slow"); });  
</script>
<script src="../../assets/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../../assets/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../assets/dist/js/demo.js"></script>