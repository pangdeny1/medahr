<?php
if (isset($_GET['PayrollID'])){
	$PayrollID = $_GET['PayrollID'];
} elseif (isset($_POST['PayrollID'])){
	$PayrollID = $_POST['PayrollID'];
} else {
	unset($PayrollID);
}
$FSMonthRow=GetPayrollRow($PayrollID, $db,5);
$FSYearRow=GetPayrollRow($PayrollID, $db,6);
$isPensionValue=0;
$DeductSSS = GetYesNoStr(GetPayrollRow($PayrollID, $db,7));
$Status = GetOpenCloseStr(GetPayrollRow($PayrollID, $db,11));
$FromPeriod = GetPayrollRow($PayrollID, $db,3);
$ToPeriod = GetPayrollRow($PayrollID, $db,4);

if ($Status=='Closed') {
   exit("Payroll is Closed. Re-open first...");
}
if (isset($_POST['submit'])) {
   exit("Contact Administrator...");
} else {
	/*
	$sql="DELETE FROM prlothericometrans WHERE payrollid ='" . $PayrollID . "'";
	$Postdelsss= DB_query($sql,$db); */

	
				$sql = "SELECT othincamount AS OTHPay,employeeid,othincid,payrollid
					FROM prloinvoicefile
			       WHERE  prloinvoicefile.payrollid='".$PayrollID."'";
		$PayDetails = DB_query($sql,$db);
		if(DB_num_rows($PayDetails)>0)
		{
			while ($myrow = DB_fetch_array($PayDetails))
			{	
			
										$sql = "INSERT INTO prlothericometrans (		
												payrollid,
												employeeid,
												otherincid,
												amount
												)
												VALUES ('$PayrollID', 
													'" . $myrow['employeeid'] . "',
													'". $myrow ['othincid'] ."',
													'". $myrow ['OTHPay'] ."'
													
													)";
													
													//excludess($myrow['fsmonth'], (($myssrow['employerss'] * $SSSGP )/100),$myrow['employeeid']);
												$ErrMsg = _('Inserting Other Income Transactions failed.');
												$InsSSSRecords = DB_query($sql,$db,$ErrMsg);	
												

					
			} 
		
	} 
	
	
	$sql = "SELECT counterindex,payrollid,employeeid,othincome
			FROM prlpayrolltrans
			WHERE prlpayrolltrans.payrollid='" . $PayrollID . "'";
	$PayDetails = DB_query($sql,$db);
	if(DB_num_rows($PayDetails)>0)
	{
		while ($myrow = DB_fetch_array($PayDetails))
		{	
			$sql = "SELECT sum(amount) AS OTHPay
					FROM prlothericometrans
			        WHERE prlothericometrans.employeeid='" . $myrow['employeeid'] . "'
					AND prlothericometrans.payrollid='".$PayrollID."'
					
					";
					$OIDetails = DB_query($sql,$db);
					if(DB_num_rows($OIDetails)>0)
					{				
						$oirow=DB_fetch_array($OIDetails);
						$OTHPayment=$oirow['OTHPay'];
						if ($OTHPayment>0 or $OTPayment<>null) {
							$sql = 'UPDATE prlpayrolltrans SET othincome='.$OTHPayment.'
								WHERE counterindex = ' . $myrow['counterindex'];
						$PostOTPay = DB_query($sql,$db);
						}
					}	
	
	}
		
	}
} //isset post submit
?>