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
	$sql = "UPDATE prlpayrolltrans SET	taxableincome=0
				WHERE payrollid ='" . $PayrollID . "'";
	$RePostGPay= DB_query($sql,$db);	
	
	$sql = "SELECT counterindex,payrollid,employeeid,basicpay,grosspay,sss,taxableincome,hdmf,philhealth
			FROM prlpayrolltrans
			WHERE prlpayrolltrans.payrollid='" . $PayrollID . "'";
	$PayDetails = DB_query($sql,$db);
	if(DB_num_rows($PayDetails)>0)
	{
		while ($myrow = DB_fetch_array($PayDetails))
		{	
				$TaxableIncome=($myrow['grosspay']- ($myrow['sss'] + $myrow['philhealth']+$myrow['hdmf']));
				$sql = 'UPDATE prlpayrolltrans SET taxableincome='.$TaxableIncome.'
						WHERE counterindex = ' . $myrow['counterindex'];
				$PostGPay = DB_query($sql,$db);
		}	 
	}
}
?>