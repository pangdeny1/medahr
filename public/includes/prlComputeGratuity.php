<?php

//$PayrollID=$payroll->id;

$Status = GetOpenCloseStr(GetPayrollRow($PayrollID, $db,11));
if ($Status=='Closed') {
   exit("Payroll is Closed. Re-open first...");
}
if (isset($_POST['submit'])) {
   exit("Contact Administrator...");
} else {
	$sql = "UPDATE prlpayrolltrans SET	gratuity=0
				WHERE payrollid ='" . $PayrollID . "'";
	$RePostGPay= DB_query($sql,$db);
	
	$sql = "SELECT counterindex,payrollid,employeeid,basicpay,grosspay,gratuity,isGratuity
			FROM prlpayrolltrans
			WHERE prlpayrolltrans.payrollid='" . $PayrollID . "'";
	$PayDetails = DB_query($sql,$db);
	if(DB_num_rows($PayDetails)>0)
	{
		while ($myrow = DB_fetch_array($PayDetails))
		{	
				$GratuityPay= (0.25 * $myrow['basicpay']);
				$sql = 'UPDATE prlpayrolltrans SET gratuity='.$GratuityPay.'
						WHERE counterindex = ' . $myrow['counterindex'];
				$PostGPay = DB_query($sql,$db);
		}	 
	}
}
?>