<?php
/*
if (isset($_GET['PayrollID'])){
	$PayrollID = $_GET['PayrollID'];
} elseif (isset($_POST['PayrollID'])){
	$PayrollID = $_POST['PayrollID'];
} else {
	unset($PayrollID);
}
*/

$PayrollID=$payroll->id;
$Status = GetOpenCloseStr(GetPayrollRow($PayrollID, $db,11));
if ($Status=='Closed') {
   exit("Payroll is Closed. Re-open first...");
}
if (isset($_POST['submit'])) {
   exit("Contact Administrator...");
} else {
	$sql = "UPDATE prlpayrolltrans SET	absent=0
				WHERE payrollid ='" . $PayrollID . "'";
	$RePostGPay= DB_query($sql,$db);	
	
	$sql = "SELECT absentid,absentdesc,employeeid,daysinperiod,daysabsent,amount,payrollid
			FROM prlabsent
			WHERE payrollid='" . $PayrollID . "'";
	$PayDetails = DB_query($sql,$db);
	if(DB_num_rows($PayDetails)>0)
	{
		while ($myrow = DB_fetch_array($PayDetails))
		{	
				$Daysinperiod=$myrow['daysinperiod'];
				$DaysAbsent=$myrow['daysabsent'];
				$prollid=$myrow['payrollid'];
				$Amount=$myrow['amount'];
				$EmpID=$row['employeeid'];
				//$AbsentPay=$Daysinperiod;
				//$AbsentPay=GetPayrollTransRow($prollid,$EmpID, $db);
				$sql = "UPDATE prlpayrolltrans SET absent='".$Amount."'
						
						WHERE payrollid='".$prollid."'  AND employeeid='". $myrow['employeeid']."'";
				$PostGPay = DB_query($sql,$db);
		}	 
	}
}
?>