<?php

session_start();  
include("../libs/db.php");

$requestData = $_REQUEST;

$query = "
  select t.dateCreated as date, (CASE WHEN (activity='IN' AND t.idItem = '$_GET[idItem]') THEN amount ELSE 0 END) AS 'in', (CASE WHEN (activity='OUT' AND t.idItem = '$_GET[idItem]') THEN amount ELSE 0 END) AS 'out', stockAmount as 'stock', pic, fullName, remarks, m.measurement, t.referenceNum
        from tabStockTransaction t
        inner join userProfile as u ON t.users = u.userID
        inner join mStock s ON t.idItem = s.idItem
        inner join mStockMeasurement as m on m.idMeasurement = t.measurement
		where t.idItem = '$_GET[idItem]'
        ORDER BY logCreated ASC
        ";
$res = mssql_query($query);

$x=0;
$data = array();
while ($row=mssql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    $nestedData[no] = $x;
    $nestedData['date'] = $row["date"];
    $nestedData[in] = $row["in"];
    $nestedData[out] = $row["out"];
    $nestedData[stock] = $row["stock"];
    $nestedData[pic] = $row["pic"];
    $nestedData[fullName] = $row["fullName"];
    $nestedData[remarks] = $row["remarks"];
    $nestedData[measurement] = $row["measurement"];
    $nestedData[referenceNum] = $row["referenceNum"];
    
    $data[] = $nestedData;
}

$json_data = array(
        "draw" => intval($requestData['draw']),   // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw.
        "recordsTotal" => mssql_num_rows($res),  // total number of records
        "recordsFiltered" => mssql_num_rows($res), // total number of records after searching, if there is no searching then totalFiltered = totalData
        "data" => $data   // total data array
    );
    echo json_encode($json_data);

?>