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
$FSMonthRow=GetPayrollRow($PayrollID, $db,5);
$FSYearRow=GetPayrollRow($PayrollID, $db,6);
$isPensionValue=0;
$DeductSSS = GetYesNoStr(GetPayrollRow($PayrollID, $db,7));
$Status = GetOpenCloseStr(GetPayrollRow($PayrollID, $db,11));
$FromPeriod = GetPayrollRow($PayrollID, $db,3);
$ToPeriod = GetPayrollRow($PayrollID, $db,4);

$openperiod=OpenPeriod($db);
$mindate=GetPayrollRow($openperiod, $db,3);
$maxdate=GetPayrollRow($openperiod, $db,4);
$PeriodStartDate=GetPayrollRow($openperiod, $db,3);

if ($Status=='Closed') {
   exit("Payroll is Closed. Re-open first...");
}
if (isset($_POST['submit'])) {
   exit("Contact Administrator...");
} else {
	$sql="DELETE FROM prlotherdeductrans WHERE payrollid ='" . $PayrollID . "'";
	$Postdelsss= DB_query($sql,$db);

	
				$sql = "SELECT othincamount AS OTHPay,prlothdedfile.employeeid as employeeid,stopdate,othincid,prlothdedfile.payrollid as payrollid,amount_term,basicpay,grosspay,percent,transaction_type
					FROM prlothdedfile

					LEFT JOIN prlpayrolltrans ON(prlpayrolltrans.employeeid=prlothdedfile.employeeid)
			      WHERE stopdate>='".$FromPeriod."' AND prlpayrolltrans.payrollid='" . $PayrollID . "' AND status=1";
					
		$PayDetails = DB_query($sql,$db);
		if(DB_num_rows($PayDetails)>0)
		{
			while ($myrow = DB_fetch_array($PayDetails))
			{	
				
				if($myrow['amount_term']=="Amount")
				{
       
       $sql = "INSERT INTO prlotherdeductrans (		
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

				else if($myrow['amount_term']=="Percent")
				{
                          if($myrow['transaction_type']=='Basic')
                          {
                          	$PayValue=(($myrow['percent'] * $myrow['basicpay'])/100);
                          }
                          else if($myrow['transaction_type']=='Gross')
                          {
                          	$PayValue=(($myrow['percent'] * $myrow['basicpay'])/100);
                          }
                         
                         else $PayValue=0;

					  $sql = "INSERT INTO prlotherdeductrans (		
												payrollid,
												employeeid,
												otherincid,
												amount
												)
												VALUES ('$PayrollID', 
													'" . $myrow['employeeid'] . "',
													'". $myrow ['othincid'] ."',
													'". $PayValue."'
													
													)";
													
													//excludess($myrow['fsmonth'], (($myssrow['employerss'] * $SSSGP )/100),$myrow['employeeid']);
													
												$ErrMsg = _('Inserting Other Income Transactions failed.');
												$InsSSSRecords = DB_query($sql,$db,$ErrMsg);

				}

				else
				{

				}
										
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
					FROM prlotherdeductrans
			        WHERE prlotherdeductrans.employeeid='" . $myrow['employeeid'] . "'
					AND prlotherdeductrans.payrollid='".$PayrollID."'
					
					";
					$OIDetails = DB_query($sql,$db);
					if(DB_num_rows($OIDetails)>0)
					{				
						$oirow=DB_fetch_array($OIDetails);
						$OTHPayment=$oirow['OTHPay'];
						if ($OTHPayment>0 or $OTPayment<>null) {
							$sql = 'UPDATE prlpayrolltrans SET otherdeduction='.$OTHPayment.'
								WHERE counterindex = ' . $myrow['counterindex'];
						$PostOTPay = DB_query($sql,$db);
						}
					}	
		//}	 
	}
		
	}
} //isset post submit
?>