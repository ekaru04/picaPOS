<?php
session_start();  
include("../../assets/config/db.php");
date_default_timezone_set('Asia/Jakarta');
$date = date("ymd");
// print_r($_POST['userID']);
$user      = $_SESSION["userID"];
if (isset($_POST['userID']))
{
	$userID = $_POST['userID'];
    $employeeNo = $_POST['employeeNo'];
	
	$checkID = mysql_query("SELECT * FROM muser WHERE userID='$userID'");
	$rowCheck = mysql_fetch_array($checkID); 
	
	$username = $_POST['username'];
	if($_POST['password']==""){
		$password = $rowCheck[password];
	}else{
		$password = hash('sha256', $_POST['password']);
	}
	
	$fullname = $_POST['fullname'];
	$outletID = strtoupper($_POST['outletID']);
	$departmentCode = $_POST['departmentCode'];
	$positionID = $_POST['positionID'];
	$isActive = $_POST['activeFlag'];
	$dateCreated = date("Y-m-d");
    $lastChanged = date("Y-m-d H:i:s");
	
	if($isActive==1){
		$status = 1;
	}else{
		$status = 0;
	}

    // $checkNo = mysql_query("SELECT * FROM muser WHERE employeeNo = '$employeeNo'");
    // $rowEmp = mysql_fetch_array($checkNo);
    // $employ = $rowEmp['employeeNo'];

    // if($employ==$employeeNo){

    //     echo "<script type='text/javascript'>alert('No Employee telah digunakan!')</script>";
    //     $URL="/picaPOS/admin/mUser/user_input.php"; 
    //     echo "<script type='text/javascript'>location.replace('$URL');</script>";
    // }

	if(mysql_num_rows($checkID)==0){
        $getNewID = mysql_query("SELECT COUNT(userID)+1 as count FROM muser");
		$rowNewID = mysql_fetch_array($getNewID);
		$newID = $rowNewID['count'];
		$userUniqID = "USR".str_pad($newID, 4, "0", STR_PAD_LEFT);
		$query = "INSERT INTO muser(userID,employeeNo,username,password,fullname,outletID,departmentCode,positionID,status,dateCreated,lastChanged)VALUES('$userUniqID', '$employeeNo', '$username', '$password', '$fullname', '$outletID', '$departmentCode', '$positionID', '$status', '$dateCreated', '$lastChanged')";
		$res = mysql_query($query);

		$journalID = date("YmdHis");
        $act = "INSERT_USER_".$username;

        $queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$act','MASTER_USER','$user','$dateCreated', '$lastChanged', 'SUCCESS')";
        $resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data tersimpan!')</script>";
	}else{
		$query = "UPDATE muser SET
				employeeNo='$employeeNo',
				username='$username',
				password='$password',
				fullname='$fullname',
				outletID='$outletID',
				departmentCode='$departmentCode',
				positionID='$positionID',
				status='$status',
				lastChanged='$lastChanged'
				WHERE userID='$userID'
				";
				$res = mysql_query($query);

		$journalID = date("YmdHis");
        $actUpd = "UPDATE_USER_".$username;

        $queryJournal = "INSERT INTO systemJournal(journalID,activity,menu,userID,dateCreated,logCreated,status) VALUES('$journalID','$actUpd','MASTER_USER','$user','$dateCreated', '$lastChanged', 'SUCCESS')";
        $resJournal = mysql_query($queryJournal);

		echo "<script type='text/javascript'>alert('Data Berhasil dirubah!')</script>";
	}
	$res = mysql_query($query);
	
	#Pain.
    if ($_POST['gst1']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'GST1'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('GST1','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'GST1'");
    }
    if ($_POST['ops1']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'A001'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('A001','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'A001'");
    }
	
    if ($_POST['ops2']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'A002'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('A002','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'A002'");
    }
	
    if ($_POST['ops3']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'A003'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('A003','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'A003'");
    }
	
    if ($_POST['trx1']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'B001'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('B001','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'B001'");
    }
	
    if ($_POST['trx2']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'B002'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('B002','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'B002'");
    }
	
    if ($_POST['trx3']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'B003'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('B003','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'B003'");
    }

    if ($_POST['trx4']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'B004'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('B004','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'B003'");
    }
	
    if ($_POST['mas1']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'C001'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('C001','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'C001'");
    }
	
    if ($_POST['mas2']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'C002'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('C002','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'C002'");
    }
	
    if ($_POST['mas3']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'C003'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('C003','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'C003'");
    }
	
    if ($_POST['mas4']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'C004'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('C004','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'C004'");
    }
	
    if ($_POST['mas5']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'C005'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('C005','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'C005'");
    }
	
    if ($_POST['mas6']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'C006'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('C006','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'C006'");
    }
	
    if ($_POST['stk1']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'D001'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('D001','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'D001'");
    }
	
    if ($_POST['stk2']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'D002'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('D002','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'D002'");
    }
	
    if ($_POST['stk3']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'D003'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('D003','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'D003'");
    }
	
    if ($_POST['rpt1']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'E001'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('E001','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'E001'");
    }
	
    if ($_POST['rpt2']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'E002'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('E002','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'E002'");
    }

    if ($_POST['rpt3']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'E003'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('E003','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'E003'");
    }
	
    if ($_POST['mgt1']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'F001'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('F001','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'F001'");
    }
	
    if ($_POST['mgt2']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'F002'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('F002','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'F002'");
    }
	
    if ($_POST['mgt3']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'F003'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('F003','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'F003'");
    }
	
    if ($_POST['mgt4']==1){
        $resItem = mysql_query("SELECT COUNT(userID) as countID FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'F004'");
        $rowItem = mysql_fetch_array($resItem);
        if($rowItem['countID']==0){
                $inputItem = mysql_query("INSERT INTO tabUserMenu(menuID,userID) VALUES('F004','$userUniqID')");
        }
    } else{
        $inputItem = mysql_query("DELETE FROM tabUserMenu WHERE userID ='$userUniqID' and menuID = 'F004'");
    }
	
}
	$URL="/picaPOS/admin/mUser"; 
    echo "<script type='text/javascript'>location.replace('$URL');</script>";
?>