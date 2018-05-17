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
$financialid=GetPayrollRow($PayrollID, $db,12);
$isPensionValue=0;
$DeductSSS = GetYesNoStr(GetPayrollRow($PayrollID, $db,7));
$Status = GetOpenCloseStr(GetPayrollRow($PayrollID, $db,11));
if ($Status=='Closed') {
   exit("Payroll is Closed. Re-open first...");
}
if (isset($_POST['submit'])) {
   exit("Contact Administrator...");
} else {
	$sql="DELETE FROM prlemployeebudgettrans WHERE payrollid ='" . $PayrollID . "'";
	$Postdelsss= DB_query($sql,$db);
	
	if ($DeductSSS=='Yes') {
		$sql = "SELECT counterindex,reghrs,payrollid,jobid,employeeid,employmentid,basicpay,absent,late,otpay,fsmonth,fsyear,isPension,pencode
				FROM prlpayrolltrans
				WHERE prlpayrolltrans.payrollid='" . $PayrollID . "' AND prlpayrolltrans.isPension='" . $isPensionValue . "'" ;
		$PayDetails = DB_query($sql,$db);
		if(DB_num_rows($PayDetails)>0)
		{
			while ($myrow = DB_fetch_array($PayDetails))
			{	
				$sql = "SELECT sum(basicpay) AS Gross,pencode,sum(reghrs) as hrswork
					FROM prlpayrolltrans
					WHERE prlpayrolltrans.employeeid='" . $myrow['employeeid'] . "'
					AND prlpayrolltrans.fsmonth='" . $FSMonthRow . "'
					AND prlpayrolltrans.isPension='" . $isPensionValue . "'
					AND prlpayrolltrans.fsyear='" . $FSYearRow . "'";
					$SSSDetails = DB_query($sql,$db);
					
					$priorHours=GetPrioAmountHours($myrow['employeeid'],1,$financialid, $db);	
					$priorAmount=GetPrioAmountHours($myrow['employeeid'],2,$financialid,$db);
					$inHrs=GetEmployeeBudg($myrow['employeeid'],3,$financialid, $db);
					$inAmnt=GetEmployeeBudg($myrow['employeeid'],4,$financialid, $db);
					
					if(DB_num_rows($SSSDetails)>0)
					{	
						$ssrow=DB_fetch_array($SSSDetails);
						$SSSGP=$ssrow['Gross'];
						
						$PENSIONCODE=$ssrow['pencode'];

						if ($SSSGP>0 or $SSSGP<>null) {
									 $myssrow = GetSSSRow($PENSIONCODE, $db);
																				
													$sql="INSERT INTO `prlemployeebudgettrans` (
                                                                                     `id` ,
                                                                                     `reghours` ,
                                                                                     `amount` ,
																					 `prioramount` ,
																					 `priorhours` ,
                                                                                     `employeeid` ,
																					 `employmentid`,
																					 `initialAmount`,
																					 `initialhrs`,
																					 `oblamount`,
																					 `oblhours`,
                                                                                     `madeat` ,
																					 `jobid`,
                                                                                     `payrollid`,
                                                                                     `financial_id`
                                                                                       )
                                                                                     VALUES (
                                                                    NULL ,
																	 '" . $myrow['reghrs'] . "',
																	 '" . $myrow['basicpay'] . "',
																	 '" . $priorAmount=GetPrioAmountHours($myrow['employeeid'],2,$financialid, $db) . "',
																	 '" . $priorAmount=GetPrioAmountHours($myrow['employeeid'],1,$financialid, $db) . "',
																	 '" . $myrow['employeeid'] . "', 
																	 '" . $myrow['employmentid'] . "',
																	  '" . GetEmployeeBudg($myrow['employeeid'],4,$financialid, $db). "',
																	   '" . GetEmployeeBudg($myrow['employeeid'],3,$financialid, $db). "',
																	 
																	   '" . GetEmployeeBudg($myrow['employeeid'],2,$financialid, $db). "',
																	   '" . GetEmployeeBudg($myrow['employeeid'],1,$financialid, $db). "',
																	    '2016-11-10',
																	  '" . $myrow['jobid'] . "' ,  
																	  '" . $myrow['payrollid'] . "',
																	   '" . $financialid. "'
                                                                         )";

													//excludess($myrow['fsmonth'], (($myssrow['employerss'] * $SSSGP )/100),$myrow['employeeid']);
													
												$ErrMsg = _('Inserting SSS File failed.');
												$InsSSSRecords = DB_query($sql,$db,$ErrMsg);
						} //if sssgp>0
					} //dbnumross sssdetials>0	
			}  //end of while
		}  //dbnumrows paydetails > 0
	} //deduct sss=yes
	

} //isset post submit
?>