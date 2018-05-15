<?php
if (isset($_GET['PayrollID'])){
	$PayrollID = $_GET['PayrollID'];
} elseif (isset($_POST['PayrollID'])){
	$PayrollID = $_POST['PayrollID'];
} else {
	unset($PayrollID);
}
//function get employee data

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
	
	$sql = "SELECT rtref,employeeid,sum(reghrs) as sumreghrs,payrollid 
			FROM prldailytrans 
			WHERE payrollid='" . $PayrollID . "'
			GROUP BY employeeid";
	$PayDetails = DB_query($sql,$db);
	if(DB_num_rows($PayDetails)>0)
	{
		while ($myrow = DB_fetch_array($PayDetails))
		{	
			
			
				$HoursWorked=$myrow['sumreghrs'];
				$prollid=$myrow['payrollid'];
				//$Amount=$myrow['amount'];
				$EmpID=$row['employeeid'];
				$sql = "UPDATE prlpayrolltrans SET reghrs='".$HoursWorked."'
						
						WHERE payrollid='".$prollid."'  AND employeeid='". $myrow['employeeid']."'";
				$PostGPay = DB_query($sql,$db);
		}	 
	}
}
?>