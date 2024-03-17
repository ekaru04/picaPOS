<?php
//    $hostname = "192.168.1.12";
//    $hostname = "192.168.1.13";
    $hostname = "localhost";

    $username = "root";
    $password = "papaBravo";
    $dbhandle = mysql_connect($hostname, $username, $password)
                or die("Unable to connect to mySQL");  
    mysql_select_db("mddc-askon");

    $server = '192.168.1.2'; 
//    $server = '192.168.1.12'; 
    $dbSQL = mssql_connect($server, 'sa', 'sps');

    if (!$dbSQL) 
    { 
        die('Something went wrong while connecting to MSSQL'); 
    }

    else 
    { 
        mssql_select_db('SYSCON'); 
    }
?>