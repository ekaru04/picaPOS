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
  <link rel='stylesheet' href='../../assets/dist/css/adminlte.min.css'>
  <!-- Daterange picker -->
  <link rel='stylesheet' href='https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css'>
  <link rel='stylesheet' href='../../assets/plugins/daterangepicker/daterangepicker.css'>
  <link rel='stylesheet' href='../../assets/libs/bootstrap-4.5.3-dist/css/bootstrap.min.css'/>
    <script src='../../assets/libs/js/jquery-3.6.0.min.js'></script>
    <script src='../../assets/libs/bootstrap-4.5.3-dist/js/bootstrap.min.js'></script>
	<script type='text/javascript'>
	
		$(document).ready(function(){  
			notif();
		});

		function responsive(){
			
		}

		function notif(){
			var get = "../../assets/template/order_notification.php";
			$.get(get, function( data ) {
				var countOrder = data.countOrder;
				$('#notif').text(data.countOrder);
			}, "json" );

		}

		setInterval(function() {
			notif();
		}, 3000 );
	</script>
    
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

<nav class="navbar navbar-expand-lg navbar-white navbar-light sticky-top" style='background-color:#70CBEA;'>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <?php

if(validMenuAccess('A001')==1){
echo" <li class='nav-item dropdown' style='background-color:#70CBEA;'>
		<a class='nav-link dropdown-toggle' href='#' id='navbardrop' data-toggle='dropdown'>
        	<b>Order</b>
        </a>
        <div class='dropdown-menu'>
        <a href='../pos' class='dropdown-item'><b>POS</b></a>

		<a href='../order' class='dropdown-item'><b>Draft Order<span id='notif' class='badge badge-pill badge-danger' style='background-color:#f9f3ed;color:black;float:right;margin-bottom:-10px;'></span></b></a>
        </div>
      </li>";
}		

if(validMenuAccess('A002')==1){		
echo" <li class='nav-item'>
		<a class='nav-link dropdown-toggle' href='#' id='navbardrop' data-toggle='dropdown'>
        	<b>Pre Order</b>
        </a>
        <div class='dropdown-menu'>
        	<a href='../preOrder' class='dropdown-item'><b>Pre-Order</b></a>
        	<a href='../draftPO' class='dropdown-item'><b>List Pre-Order<span id='notif' class='badge badge-pill badge-danger' style='background-color:#f9f3ed;color:black;float:right;margin-bottom:-10px;'></span></b></a>
        </div>
      </li>";
}	

?>	
<ul class='navbar-nav mr-auto'>
      <li class='nav-item dropdown navbar-left'>
    	<a class='nav-link dropdown-toggle' href='#' id='navbardrop' data-toggle='dropdown'>
        	<b>Other</b>
        </a>
        <div class='dropdown-menu'>
        	<a href='../endorsement' class='dropdown-item'><b>Endorsement Cashier</b></a>
        	<a href='../discount' class='dropdown-item'><b>Discount Cashier</b></a>
        	<a href='#' class='dropdown-item'><b>List Pre-Order<span id='notif' class='badge badge-pill badge-danger' style='background-color:#f9f3ed;color:black;float:right;margin-bottom:-10px;'></span></b></a>
        </div>
      </li>
    </ul>

<?php 
if(validMenuAccess('A003')==1){		
echo" <li class='nav-item'>
        <a href='../closeCashier' class='nav-link' ><b>Close Cashier</b></a>
      </li>";
}		
		
echo"</ul>
    <ul class='navbar-nav ml-auto mr-3 dropdown-menu-right' style='right:auto; left: auto;'>
      <li class='nav-item'>
        <a href='../../admin/dashboard' class='nav-link'><b>ADMIN</b></a>
      </li>
      <li class='nav-item dropdown navbar-left'>
        <a class='nav-link dropdown-toggle' href='#' id='navbardrop' data-toggle='dropdown'>
        	<b>$data[fullname]</b>
        </a>
        <div class='dropdown-menu'>
          <a class='dropdown-item' href='/picaPOS/app/destroy_process.php'><b>Logout</b></a>
        </div>
      </li>";
?>
    </ul>
  </div>
</nav>	

  <!-- Navbar -->
  <!-- <nav class='navbar navbar-expand navbar-white navbar-light' style='background-color:#70CBEA;'>
  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class='navbar-nav '>
<?php

if(validMenuAccess('A001')==1){
echo" <li class='nav-item d-none d-sm-inline-block'>
        <a href='../pos' class='nav-link'><b>POS</b></a>
      </li>";
}		
if(validMenuAccess('A002')==1){		
echo" <li class='nav-item d-none d-sm-inline-block'>
        <a href='../order' class='nav-link'><b>Order<span id='notif' class='badge badge-pill badge-danger' style='background-color:#f9f3ed;color:black;float:right;margin-bottom:-10px;'></span></b></a>
      </li>";
}		
if(validMenuAccess('A003')==1){		
echo" <li class='nav-item d-none d-sm-inline-block'>
        <a href='../closeCashier' class='nav-link' ><b>Close Cashier</b></a>
      </li>";
}		
		
echo"</ul>
    <ul class='navbar-nav ml-auto mr-3 dropdown-menu-right' style='right:auto; left: auto;'>
      <li class='nav-item d-none d-sm-inline-block'>
        <a href='../../admin/dashboard' class='nav-link'><b>ADMIN</b></a>
      </li>
      <li class='nav-item dropdown navbar-left'>
        <a class='nav-link dropdown-toggle' href='#' id='navbardrop' data-toggle='dropdown'>
        	<b>$data[fullname]</b>
        </a>
        <div class='dropdown-menu'>
          <a class='dropdown-item' href='/picaPOS/app/destroy_process.php'><b>Logout</b></a>
        </div>
      </li>";
?>
    </ul>  
    </div>
  </nav> -->
	
	
