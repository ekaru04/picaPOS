<?php

   $hostname = "localhost";
   $username = "root";
   $password = "";
//   $password = "";
   $dbhandle = mysql_connect($hostname, $username, $password)or die("Unable to connect to mySQL");  
   mysql_select_db("picapos");
   
?>