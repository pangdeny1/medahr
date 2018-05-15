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
	$sql="DELETE FROM prlothericometrans WHERE payrollid ='" . $PayrollID . "'";
	$Postdelsss= DB_query($sql,$db);

	//$sql = "UPDATE prlpayrolltrans SET	sss=0
				//WHERE payrollid ='" . $PayrollID . "'";
	//$RePostSSS= DB_query($sql,$db);	
	
	//if ($DeductSSS=='Yes') {
		/*$sql = "SELECT counterindex,payrollid,employeeid,basicpay,absent,late,otpay,fsmonth,fsyear,isPension,pencode
				FROM prlpayrolltrans
				WHERE prlpayrolltrans.payrollid='" . $PayrollID . "' " ; */
				$sql = "SELECT othincamount AS OTHPay,employeeid,stopdate,othincid,payrollid
					FROM prlothincfile
			       WHERE  (prlothincfile.payrollid='".$PayrollID."' || recurrent=0) AND status=0
					ORDER BY OthDate";
		$PayDetails = DB_query($sql,$db);
		if(DB_num_rows($PayDetails)>0)
		{
			while ($myrow = DB_fetch_array($PayDetails))
			{	
				/*$sql = "SELECT othincamount AS OTHPay,employeeid,stopdate,othincid,payrollid
					FROM prlothincfile
			       WHERE prlothincfile.employeeid='" . $myrow['employeeid'] . "'
					AND (prlothincfile.payrollid='".$PayrollID."' || recurrent=0) AND status=0
					ORDER BY OthDate";
					$SSSDetails = DB_query($sql,$db); 
						
					
					if(DB_num_rows($SSSDetails)>0)
					{	
						$ssrow=DB_fetch_array($SSSDetails);
						$SSSGP=$ssrow['Gross'];
						
						$PENSIONCODE=$ssrow['pencode']; */

						//if ($SSSGP>0 or $SSSGP<>null) {
									 //$myssrow = GetSSSRow($PENSIONCODE, $db);
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
						//} //if sssgp>0
					//} //dbnumross sssdetials>0	
			}  //end of while
		//}  //dbnumrows paydetails > 0
	} //deduct sss=yes
	
	//posting to payroll trans for sss
	//if ($DeductSSS=='Yes') {
		
	
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
		//}	 
	}
		
	}
} //isset post submit
?>