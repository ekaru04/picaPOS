<?php
include('../../assets/config/db.php');
session_start();

function validMenuAccess($tagID) 
{
	$userID = $_SESSION[userID];

	$query = "SELECT * FROM tabUserMenu WHERE userID='$userID' And menuID='$tagID'";
	$res=mysql_query($query);

	$rows = mysql_num_rows($res);
	if($rows > 1)
	{
		$rows = 1;
	}

	mysql_free_result($res);

    return $rows;
}

$query = mysql_query("SELECT * FROM muser WHERE userID = '$_SESSION[userID]'");
$data = mysql_fetch_array($query);

?>

<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <title>picaPOS | POS Bakery System</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <!-- Font Awesome -->
  <link rel='stylesheet' href='../../assets/plugins/fontawesome-free/css/all.min.css'>
  <!-- Ionicons -->
  <link rel='stylesheet' href='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
  <!-- Theme style -->
  <link rel='stylesheet' href='../../assets/plugins/chart.js/Chart.css'>
  <link rel='stylesheet' href='../../assets/plugins/chart.js/Chart.min.css'>
  <link rel='stylesheet' href='../../assets/dist/css/adminlte.min.css'>
  <!-- Daterange picker -->
  <link rel='stylesheet' href='https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css'>
  <link rel='stylesheet' href='../../assets/plugins/daterangepicker/daterangepicker.css'>
  <link rel='stylesheet' href='../../assets/libs/bootstrap-4.5.3-dist/css/bootstrap.min.css'/>
    <script src='../../assets/libs/js/jquery-3.6.0.min.js'></script>
    <script src='../../assets/libs/bootstrap-4.5.3-dist/js/bootstrap.min.js'></script>
    
    <!-- datatables -->
    <script src='../../assets/libs/DataTables/datatables.min.js'></script>
      <link rel='stylesheet' type='text/css' href='../../assets/libs/DataTables/datatables.min.css'/>
  <!-- Google Font: Source Sans Pro -->
  <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700' rel='stylesheet'>
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
		
		.dropdown-menu li {
		position: relative;
		}
		.dropdown-menu .dropdown-submenu {
		display: none;
		position: absolute;
		left: 100%;
		top: -7px;
		}
		.dropdown-menu .dropdown-submenu-left {
		right: 100%;
		left: auto;
		}
		.dropdown-menu > li:hover > .dropdown-submenu {
		display: block;
		}
	</style>
</head>
<body>

  <!-- Navbar -->
<nav class='navbar navbar-expand-lg navbar-white navbar-light sticky-top' style='background-color:#70CBEA;'>
  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
  	</button>
  	<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <!-- Left navbar links -->
    <ul class='navbar-nav '>
    	<li>
    		<a class='nav-link' href="../dashboard"><b>DASHBOARD</b></a>
    	</li>
      <!-- 
       <li class='nav-item d-none d-sm-inline-block'>
        <a href='../restock' class='nav-link'>Restock</a>
      </li> -->
<?php
if(validMenuAccess('B001')==1||validMenuAccess('B002')==1||validMenuAccess('B003')==1){
echo" <li class='nav-item dropdown'>
        <a class='nav-link dropdown-toggle' href='#' id='navbardrop' data-toggle='dropdown'>
        	<b>Transaction</b>
        </a>
        <div class='dropdown-menu'>";
		  
	if(validMenuAccess('B001')==1){
echo"     <a class='dropdown-item' href='../restockIngredient'><b>Restock Ingredient</b></a>";
	}
		
	if(validMenuAccess('B002')==1){
echo"     <a class='dropdown-item' href='../reqIn'><b>Production Input</b></a>";
	}
		
	if(validMenuAccess('B003')==1){
echo"     <a class='dropdown-item' href='../restockProduct'><b>In/Out Product</b></a>";
echo"     <a class='dropdown-item' href='../itemTrans'><b>In/Out Item</b></a>";
	}

	if(validMenuAccess('B004')==1){
echo"     <a class='dropdown-item' href='../pengeluaran'><b>Pengeluaran</b></a>";
	}
echo"   </div>
      </li>";
}

if(validMenuAccess('C005')==1||validMenuAccess('C006')==1){
echo" <li class='nav-item dropdown'>
        <a class='nav-link dropdown-toggle' href='#' id='navbardrop' data-toggle='dropdown'>
        	<b>Store</b>
        </a>
        <div class='dropdown-menu'>";
	if(validMenuAccess('C005')==1){
echo"     <a class='dropdown-item' href='../promo'><b>Promo</b></a>";
	}
	if(validMenuAccess('C006')==1){
echo"     <a class='dropdown-item' href='../activeVouchers'><b>Vouchers</b></a>";
echo"     <a class='dropdown-item' href='../sentToStore'><b>Restock Product</b></a>";
	}
echo"   </div>
      </li>";
}
if(validMenuAccess('D001')==1||validMenuAccess('D002')==1||validMenuAccess('D003')==1){
echo" <li class='nav-item dropdown'>
        <a class='nav-link dropdown-toggle' href='#' id='navbardrop' data-toggle='dropdown'>
        <b>Stock</b>
        </a>
        <div class='dropdown-menu'>";
	if(validMenuAccess('D001')==1){
echo"     <a class='dropdown-item' href='../ingredients'><b>Ingredients</b></a>";
	}
	if(validMenuAccess('D002')==1){
echo"     <a class='dropdown-item' href='../recipes'><b>Recipes</b></a>";
	}
	if(validMenuAccess('D003')==1){
echo"     <a class='dropdown-item' href='../products'><b>Products</b></a>";
echo"     <a class='dropdown-item' href='../itemStock'><b>Stock Item</b></a>";
echo"     <a class='dropdown-item' href='../bundle'><b>Bundle Item</b></a>";
echo"     <a class='dropdown-item' href='../kitchen'><b>Stock Kitchen</b></a>";
	}
echo"   </div>
      </li>";
}
	
if(validMenuAccess('B001')==1||validMenuAccess('B002')==1||validMenuAccess('B003')==1){
echo" <li class='nav-item dropdown'>
        <a class='nav-link dropdown-toggle' href='#' id='navbardrop' data-toggle='dropdown'>
        <b>Master Data</b>
        </a>
        <div class='dropdown-menu'>";
	if(validMenuAccess('C001')==1){
echo"     <a class='dropdown-item' href='../categories'><b>Products Categories</b></a>";
echo"     <a class='dropdown-item' href='../categoriesStock'><b>Items Categories</b></a>";
	}
	if(validMenuAccess('C002')==1){
echo"     <a class='dropdown-item' href='../measurements'><b>Measurements</b></a>";
	}
	if(validMenuAccess('C003')==1){
echo"     <a class='dropdown-item' href='../payment'><b>Payment Method</b></a>";
	}
	if(validMenuAccess('C004')==1){
echo"     <a class='dropdown-item' href='../suppliers'><b>Suppliers</b></a>";
echo"     <a class='dropdown-item' href='../mCustomers'><b>Customers</b></a>";
echo"     <a class='dropdown-item' href='../mPrices'><b>Master Price</b></a>";
echo"     <a class='dropdown-item' href='../priceList'><b>Price List</b></a>";
	}
echo"   </div>
      </li>";
}
if(validMenuAccess('E001')==1||validMenuAccess('E002')==1){
echo" <li class='nav-item dropdown'>
        <a class='nav-link dropdown-toggle' href='#' id='navbardrop' data-toggle='dropdown'>
        <b>Reports</b>
        </a>
		<ul class='dropdown-menu' >";
	if(validMenuAccess('E001')==1){
echo"		<li>
				<a class='dropdown-item' href='#'><b>Sales</b></a>

			</li>";
	}
	if(validMenuAccess('E002')==1){
echo"		<li>
				<a class='dropdown-item' href='#'><b>Production</b></a>
			</li>";  
	}
	if(validMenuAccess('E003')==1){
echo"		<li>
				<a class='dropdown-item' href='../transactionReport'><b>Transactions Reports</b></a>
			</li
			<li>
				<a class='dropdown-item' href='../preorderReport'><b>Transactions Pre-Order</b></a>
			</li>";
// echo"		<li>
// 				<a class='dropdown-item' href='../incomeReport'><b>Income</b></a>
// 			</li>";  
	}
echo"   </ul>
      </li>";
}

?>
	<li class="nav-item">
        <a class="nav-link" href='../activityLog'><b>Activity Log</b></a>
    </li>
<?php
		
if(validMenuAccess('F001')==1||validMenuAccess('F002')==1||validMenuAccess('F003')==1||validMenuAccess('F004')==1){
echo" <li class='nav-item dropdown'>
        <a class='nav-link dropdown-toggle' href='#' id='navbardrop' data-toggle='dropdown'>
        <b>Management</b>
        </a>
        <div class='dropdown-menu'>";
	if(validMenuAccess('F001')==1){
echo"     <a class='dropdown-item' href='../outlets'><b>Outlets</b></a>";
	}
	if(validMenuAccess('F002')==1){
echo"     <a class='dropdown-item' href='../mUser'><b>Users</b></a>";
	}
	if(validMenuAccess('F003')==1){
echo"     <a class='dropdown-item' href='../mDepartment'><b>Departments</b></a>";
	}
	if(validMenuAccess('F004')==1){
echo"     <a class='dropdown-item' href='../mPosition'><b>Positions</b></a>";
echo"     <a class='dropdown-item' href='../mLoyalty'><b>Set Loyalty</b></a>";
	}
echo"   </div>
      </li>";
}
?>
    </ul>
    <ul class='navbar-nav ml-auto mr-3 dropdown-menu-right' style='right:auto; left: auto;'>
      <li class='nav-item navbar-left'>
        <a href='../../app/pos' class='nav-link'><b>POS</b></a>
      </li>
      <li class='nav-item dropdown navbar-left'>
        <a class='nav-link dropdown-toggle' href='#' id='navbardrop' data-toggle='dropdown'>
        <b><?php echo $data['fullname']; ?></b>
        </a>
        <div class='dropdown-menu'>
          <a class='dropdown-item' href='../destroy_process.php'><b>Logout</b></a>
        </div>
      </li>
    </ul>
</div>	
    <!-- Right navbar links -->    
  </nav>