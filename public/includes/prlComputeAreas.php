<?php
if (isset($_GET['PayrollID'])){
	$PayrollID = $_GET['PayrollID'];
} elseif (isset($_POST['PayrollID'])){
	$PayrollID = $_POST['PayrollID'];
} else {
	unset($PayrollID);
}

$Status = GetOpenCloseStr(GetPayrollRow($PayrollID, $db,11));
if ($Status=='Closed') {
   exit("Payroll is Closed. Re-open first...");
}
if (isset($_POST['submit'])) {
   exit("Contact Administrator...");
} else {
	$sql = "UPDATE prlpayrolltrans SET	areaspay=0
				WHERE payrollid ='" . $PayrollID . "'";
	$RePostGPay= DB_query($sql,$db);	
	
	$sql = "SELECT areasid,areasdesc,employeeid,date,amount,payrollid
			FROM prlareasfile
			WHERE prlareasfile.payrollid='" . $PayrollID . "'";
	$PayDetails = DB_query($sql,$db);
	if(DB_num_rows($PayDetails)>0)
	{
		while ($myrow = DB_fetch_array($PayDetails))
		{	
				$AreasPay=$myrow['amount'];
				$prollid=$myrow['payrollid'];
				$sql = "UPDATE prlpayrolltrans SET areaspay='".$AreasPay."'
						
						WHERE payrollid='".$prollid."'  AND employeeid='". $myrow['employeeid']."'";
				$PostGPay = DB_query($sql,$db);
		}	 
	}
}
?>