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
	$sql = "UPDATE prlpayrolltrans SET	grosspay=0
				WHERE payrollid ='" . $PayrollID . "'";
	$RePostGPay= DB_query($sql,$db);	
	
	$sql = "SELECT counterindex,payrollid,employeeid,basicpay,othincome,absent,gratuity,late,otpay,areaspay,hourlyrate,reghrs
			FROM prlpayrolltrans
			WHERE prlpayrolltrans.payrollid='" . $PayrollID . "'";
	$PayDetails = DB_query($sql,$db);
	if(DB_num_rows($PayDetails)>0)
	{
		while ($myrow = DB_fetch_array($PayDetails))
		{	
				$GrossPay=$myrow['basicpay']+$myrow['otpay']+$myrow['othincome']+$myrow['areaspay']-$myrow['absent']-$myrow['late'];
				$sql = 'UPDATE prlpayrolltrans SET grosspay='.$GrossPay.'
						WHERE counterindex = ' . $myrow['counterindex'];
				$PostGPay = DB_query($sql,$db);
		}	 
	}
}
?>