<?php

session_start();  
include("../libs/db.php");

$requestData = $_REQUEST;

$query = "select s.idItem as idItem,itemName, cat.category as category, m.measurement as measurement,curStock,minStock,loc.location,cond.condition 
            from mStock as s inner join mStockCategory as cat on s.category = cat.idCategory
                             inner join mStockMeasurement as m on s.measurement = m.idMeasurement
                             inner join mStockLocation as loc on s.location = loc.idLocation
                             inner join mStockCondition as cond on s.condition = cond.idCondition
            where s.status != 0
            order by idItem";
$res = mssql_query($query);

$x=0;
$data = array();
while ($row=mssql_fetch_array($res)){
    $x+=1;
    $nestedData = array();
    
    $nestedData[idItem] = $row["idItem"];
    $nestedData[no] = $x;
    $nestedData[itemName] = "<a href='/app/wh-item/item_history.php?idItem=$row[idItem]'>$row[itemName]</a>";
    $nestedData[category] = $row["category"];
    $nestedData[measurement] = $row["measurement"];
    $nestedData[curStock] = $row["curStock"];
    $nestedData[minStock] = $row["minStock"];
    $nestedData[location] = $row["location"];
    $nestedData[condition] = $row["condition"];
    $nestedData[action] = "<a href='/app/wh-item/item_input.php?idItem=$row[idItem]'>EDIT</a>";
    
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