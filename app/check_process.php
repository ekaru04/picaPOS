<?php 

include("../assets/config/db.php");
session_start();

if(isset($_POST['submit'])){

$username = $_POST['username'];
$pass = hash('sha256', $_POST['password']);
 // echo "$pass <br/>";

$query = mysql_query("SELECT * FROM muser WHERE username='$username' AND password='$pass'");
$cek = mysql_fetch_array($query);
$user = $cek['username'];
$pass1 = $cek['password'];

// echo $pass1;

	if($username == $user && $pass == $pass1){
		$_SESSION['username'] = $username;
		$_SESSION['userID'] = $cek['userID'];
		$_SESSION['fullname'] = $cek['fullname'];
		$_SESSION['outletID'] = $cek['outletID'];
		echo "<script type='text/javascript'>alert('Berhasil Login')</script>";
		$URL="/picaPOS/app/pos"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
		
	}else{
		echo "<script type='text/javascript'>alert('Gagal Login')</script>";
		$URL="/picaPOS/app"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
		
	}

}

?>