<?php
session_start();
if (!isset($_SESSION["username"])) 
{
    $URL="/picapos/admin"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
}
include("../../assets/config/db.php");      
include('../../assets/template/navbar.php');
?>
<div>
       <div class='clear height-20 mt-3'></div>
        <div class="container-fluid">
         <div class='entry-box-basic'>
           <h1 class="text-center">
               OUT STOCK
           </h1>
          <div class="container-fluid">
           <div class="row">
            <div class="col-8">
                <form id='formAdd' method='POST' action='outstock_process.php' enctype="multipart/form-data">

                    <div class='row  mt-3 '>
                        <div class='col-3 label'>
                           <input type='text' class='form-control-plaintext' disabled value='TYPE' />
                        </div>
                        <div class='col-3'>
                            <select class='select-cust form-control' name='type' style='width:300px;' required>
                                <option value='1'>OUT</option>
                                <option value='2'>ADJUSTMENT</option>
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
                                    $queryOutlet="select * from moutlet where status != 0";
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
                           <input type='text' class='form-control-plaintext' disabled value='INGREDIENT' />
                        </div>
                        <select class='select-cust ml-3 form-control' name='ingredientID' id='ingredientID' style='width:300px;' selected>
                            <option value=''>-CHOOSE ONE-</option>
                                <?php
                                    $queryIngredient="select * from mingredient where status != 0";
                                    $resIngredient=mysql_query($queryIngredient);
                                    while($rowIngredient=mysql_fetch_array($resIngredient)){
                                        if($rowIngredient[ingredientID] == $row[ingredientID]){
                                            echo "<option selected value='$rowIngredient[ingredientID]'>$rowIngredient[ingredient]</option>";
                                        }else{
                                            echo "<option value='$rowIngredient[ingredientID]'>$rowIngredient[ingredient]</option>";
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
                            <input type='text' class='type-input form-control' name='amount' placeholder='Amount' style='width:300px' required />
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
                  </div>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>
<script type="text/javascript">
    
    $("#cancel").click(function(){
        alert("Data tidak tersimpan");
        location.replace('/picaPOS/admin/products/');
    });
    
    $("#del").click(function(){
        var r = confirm("Apakah yakin ingin menghapus data ini?");
        if(r){
            <?php echo "location.replace('product_delete.php?productID=$productID');"?>
        }
    });

    $(document).on('change','#outletID',function(){
        var val = $('#outletID').val();
        $.ajax({
            url: 'outstock_list.php',
            data: {outletID:val},
            type: 'GET',
            dataType: 'html',
            success: function(result){
                $('#ingredientID').html(); 
                $('#ingredientID').html(result); 
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