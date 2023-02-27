<?php

session_start();  
include("../libs/db.php"); 
include("../PHPExcel-1.8.1/Classes/PHPExcel.php"); 

$objPHPExcel = new PHPExcel();
$writer = PHPExcel_IOFactory::createWriter($objPHPExcel, "Excel2007");

$itemList  = new PHPExcel_Worksheet($objPHPExcel, 'Stock List (All)');
$objPHPExcel->addSheet($itemList, 0);
$sheet = $objPHPExcel->setActiveSheetIndex(0);

$sheet->mergeCells("A1:E1");
$sheet->getCell("A1")->setValue("PT. ARTHA SAMUDRA KONTINDO");

$prtdate = date('d/m/Y H:i:s');
$sheet->mergeCells("I1:O1");
$sheet->getCell("I1")->setValue("Print Date: $prtdate");

$sheet->mergeCells("A2:E2");
$sheet->getCell("A2")->setValue("Kawasan Industri Cipta Guna Blok 9");

$sheet->mergeCells("I2:O2");
$sheet->getCell("I2")->setValue("Print By: $_SESSION[fullName]");

$sheet->mergeCells("A3:E3");
$sheet->getCell("A3")->setValue("Jl. Arteri Yos Sudarso, Semarang - 50174");

$sheet->mergeCells("A4:E4");
$sheet->getCell("A4")->setValue("Phone #: (+6224) 76588117");

$sheet->mergeCells("A6:F6");
$sheet->getCell("A6")->setValue("ASKON FULL STOCK REPORT ".date('d F Y'));

$sheet->getCell("A8")->setValue("No");
$sheet->getCell("B8")->setValue("Item Name");
$sheet->getCell("C8")->setValue("Category");
$sheet->getCell("D8")->setValue("Current Stock");
$sheet->getCell("E8")->setValue("Measurement");
$sheet->getCell("F8")->setValue("Location");

$sheet->getStyle('A1:E1')->getFont()->setBold(true);
$sheet->getStyle('A6:O6')->getFont()->setBold(true);
$sheet->getStyle('A8:O8')->getFont()->setBold(true);

$query = "SELECT s.itemName,c.category,s.curStock,m.measurement,l.location FROM mStock s inner join mStockCategory c on s.category=c.idCategory INNER JOIN mStockMeasurement m ON s.measurement = m.idMeasurement INNER JOIN mStockLocation l ON s.location=l.idLocation WHERE s.status = 1 ORDER BY c.category asc, s.itemName asc";
$res = mssql_query($query);
$a = 1;
$c = 9;
while($row=mssql_fetch_array($res)){
    $cNo = "A".$c;
    $sheet->getCell("$cNo")->setValue("$a");
    
    $cItem = "B".$c;
    $sheet->getCell("$cItem")->setValue("$row[itemName]");
    
    $cCat = "C".$c;
    $sheet->getCell("$cCat")->setValue("$row[category]");
    
    $cStock = "D".$c;
    $sheet->getCell("$cStock")->setValue("$row[curStock]");
    
    $cMea = "E".$c;
    $sheet->getCell("$cMea")->setValue("$row[measurement]");
    
    $cLoc = "F".$c;
    $sheet->getCell("$cLoc")->setValue("$row[location]");
    
    $a++;
    $c++;
}

$dirloc   = "results/";
$file = "ASKON FULL STOCK REPORT ".date('Ymd').".xlsx";
$filename = $dirloc.$file;
$writer->save($filename); 

header('Content-Type: application/vnd.ms-excel'); //mime type
header("Content-Disposition: attachment;filename=$file"); //tell browser what's the file name
header('Cache-Control: max-age=0'); //no cache

$writer->save('php://output');
$objPHPExcel->disconnectWorksheets();
unset($writer, $objPHPExcel);

?>