<?php
//include_once("ConnectDB_mysql.inc");

// All Functions
// *************
//function beg() /
//{
//var myConfirm = confirm("Sure you want to leave?");
//return myConfirm
//} 


//

//function to Display Menu





function PayrollMenu($db,$sessionuser)
{
	if(ismss($sessionuser,$db)==0)
	{
	$sql = "SELECT id,mainmenu_name,file,icon,status,priority FROM tbl_mainmenu where status=0 and menu_type='ESS' order by priority";
			$result = DB_query($sql, $db);	
	}
     else
     {  

	 $sql = "SELECT id,mainmenu_name,file,icon,status,priority FROM tbl_mainmenu where status=0 order by priority";
			$result = DB_query($sql, $db);

		}
			while($myrow = DB_fetch_array($result))
			{
				 echo "<li class='xn-openable'>";
        echo"<a href='#''><span class='".$myrow['icon']."''></span> <span class='xn-text'>".$myrow['mainmenu_name']."</span></a>";

        $sql_menu = "SELECT id,menu_name,menu_file,status,priority,icon FROM tbl_menu
                     WHERE mainmenu_id=".$myrow['id']." and status=0    order by priority";
			$result_menu = DB_query($sql_menu, $db);
			while($myrow_menu = DB_fetch_array($result_menu))
			{
           echo "<ul>";
                           echo" <li><a href='".$myrow_menu['menu_file']."'><span class='".$myrow_menu['icon']."'></span>".$myrow_menu['menu_name']."</a></li>";
                                                        
                      echo"</ul>";

			}

          echo" </li>"; 


           
			}	
}





function sendMailNot($to,$subject,$message,$from)
{
 
$emailto=$to;
if(empty($emailto))
{
$emailto = 'pangdeny@gmail.com';
}



$message=$message;
$from = "No Reply";
mail($emailto,$subject,$message,$from);

}


function ismss($sessionuser,$db)
{

    $QuerySQL = "SELECT mss FROM www_users
	             WHERE userid = '$sessionuser'";
	$ErrMsg =  _('The period User could not be retreived because');
	$GetPayDescResult = DB_query($QuerySQL, $db, $ErrMsg);

	$myrow = DB_fetch_array($GetPayDescResult);
	if($myrow['mss']==1)
		return 1;

	else return 0; 
	
	
}

function firstDay( $date)
{
	$date    =    '2012-02-12';//your given date

$first_date_find = strtotime(date("Y-m-d", strtotime($date)) . ", first day of this month");
echo 'First Date:'. $first_date = date("Y-m-d",$first_date_find);
$first_date = date("Y-m-d",$first_date_find);
 return $first_date;
 
}

function GetYesNoStr($YesNo)
{
		If ($YesNo ==1) {
				$YesNoStr='Yes';
		} else {
				$YesNoStr='No';
		}  
      return $YesNoStr;
}

function GetYesNo($YesNo)
{
		If ($YesNo ==1) {
				$YesNoStr='Yes';
		} else {
				$YesNoStr='No';
		}  
      return $YesNoStr;
}
function GetActive($YesNo)
{
		If ($YesNo ==1) {
				$YesNoStr='In-Active';
		} else {
				$YesNoStr='Active';
		}  
      return $YesNoStr;
}

function GetCloseOpen($YesNo)
{
		If ($YesNo ==1) {
				$YesNoStr="<font color='red'>Closed</font>";
		} else {
				$YesNoStr="<font color='blue'>Open</font>";
		}  
      return $YesNoStr;
}



function GetApproveStatus($YesNo)

{
$YesNoStr='N/A';
		If ($YesNo == 0) {
				$YesNoStr='<font color=blue>Pending</font>';
				
		}
		If ($YesNo == 1) {
				$YesNoStr='<font color=green >Approved<font>';
				
		} 
		If ($YesNo == 2) {
				$YesNoStr='<font color=red >Rejected</font>';
				}
			 
      return $YesNoStr;
}


function GetAtctiveOrInactive($YesNo)
{
		If ($YesNo ==0) {
				$YesNoStr='Active';
		} else {
				$YesNoStr='In-Active';
		}  
      return $YesNoStr;
}


function GetEmployeePayType($YesNo)
{
		If ($YesNo ==0) {
				$YesNoStr='Salary';
		} else {
				$YesNoStr='Hourly';
		}  
      return $YesNoStr;
}

function GetOpenCloseStr($OC)
{
		If ($OC ==1) {
				$OCStr='Open';
		}
  else if	($OC ==2)	{
				$OCStr='Closed';
		} 
else 
      $OCStr='Invalid Id';		
      return $OCStr;
}


function isweekend($date)
{

$date1 = strtotime($date);
$date2 = date("l", $date1);
$date3 = strtolower($date2);

if (($date3 == "saturday") || ($date3 == "sunday")) {
    return 1;
} else {
    return 0;
}

}

function GetPayTypeDesc($PT)
{
		If ($PT==1) {
			$PTStr='Salary';
		} elseif ($PT==2) {
			$PTStr='Hourly';
		} else {
			$PTStr='Unknown';
		}  
      return $PTStr;
}


Function GetPayPeriodDesc($PeriodID, $db){

/*Gets the GL Codes relevant to the stock item account from the stock category record */

    $QuerySQL = "SELECT payperiodid, payperioddesc FROM prlpayperiod
	             WHERE payperiodid = '$PeriodID'";
	$ErrMsg =  _('The period code could not be retreived because');
	$GetPayDescResult = DB_query($QuerySQL, $db, $ErrMsg);

	$myrow = DB_fetch_array($GetPayDescResult);
	return $myrow[1];
}

Function GetAttachement($PeriodID,$EmpID,$Othinc, $db){

/*Gets the GL Codes relevant to the stock item account from the stock category record */

    $QuerySQL = "SELECT id,name,employeeid,payrollid,expid,attachement FROM expenseattachement
	             WHERE expid='".$Othinc."' AND employeeid='".$EmpID."' AND payrollid = '".$PeriodID."'";
	
	$GetPayDescResult = DB_query($QuerySQL, $db, $ErrMsg);

	$myrow = DB_fetch_array($GetPayDescResult);
	
	
	return $myrow[1];
}

Function isholiday($date, $db){
$date=date("Y-m-d", strtotime($date));

 $result = mysql_query("SELECT * FROM  `prlholidays` WHERE  `holdate` = '$date'");
    if (mysql_num_rows($result) > 0) 
	{
        return 1;
    }
    else {
        return 0;
    
}
//Select Company Logo





}



Function logo($db)
{
 
$sql = "SELECT regoffice5  FROM companies";
			
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);

			return $myrow['regoffice5'];
    
}


Function CompanyName($db)
{
 
$sql = "SELECT coyname  FROM companies";
			
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);

			return $myrow['coyname'];
    
}
Function PendingStatus($empid,$pid,$db)
{


$sql = "select counterindex from prloinvoicefile where employeeid=".$empid." and payrollid='".$pid."' AND( approved = 0 OR approved=2)";
	$result = DB_query($sql, $db);
	$numrows=DB_num_rows($result);
		
    if ($numrows > 0 ) 
	{
        $status= "<font color=blue>Pending</font>";
    }
        else{
     $status= "<font color=green>Approved</font>";
            }
return $status;

}

function insertNotificationMessage($db,$Type,$Subject,$Message,$MessageFrom,$MessageTo,$PayrollID)
{
$sql = "INSERT INTO prlmessages (						
						id,
						type,
						subject,
						message,
						messagefrom,
						messageto,
						payrollid
						
						)
				VALUES (
					'',
					'" .$Type."',
					'" . $Subject . "',
					'" . $Message. "',
					'" . $MessageFrom. "',
					'" . $MessageTo. "',
					'" . $PayrollID . "'
					)";	
			
			$ErrMsg = _('The Message ') . ' ' . $_POST['PayrollID'] . ' ' . _('could not be added because');
			$DbgMsg = _('The SQL that was used to insert the Message but failed was');
			$result = DB_query($sql, $db, $ErrMsg, $DbgMsg);

}

Function PendingStatusTimesheet($empid,$pid,$db)
{


$sql = "select counterindex from prldailytrans where employeeid=".$empid." and payrollid='".$pid."' AND( approved = 0 OR approved=2)";
	$result = DB_query($sql, $db);
	$numrows=DB_num_rows($result);
		
    if ($numrows > 0 ) 
	{
        $status= "<font color=blue>Pending</font>";
    }
        else{
     $status= "<font color=green>Approved</font>";
            }
return $status;

}
Function EmpExpenses($empid,$period,$tranid,$cat,$db)
{


$sql = "SELECT sum(othincamount) amount, sum(quantity) as qty,sum(subamount) as sub
			FROM prloinvoicefile
			WHERE payrollid='".$period."' AND othincid='".$tranid."' AND employeeid='".$empid."'";
			
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			
			if($cat==amt)
			{
			return $myrow['amount'];
			}
			else if ($cat==qty)
			{
				return $myrow['qty'];
			}
			else if($cat==sub)
			{
				return $myrow['sub'];
			}
			else return 0;
				
			
	

}

//function to check if there is pending form

Function PendingForm($empid ,$db){
$sql = "SELECT count(id) numrows FROM travel_request WHERE employeeid='".$empid."' AND approved_status='Pending'";

$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);

			return $myrow['numrows'];

/* $result = mysql_query("SELECT id FROM travel_request WHERE employeeid='".$empid."' AND approved_status='Pending'");
    if (mysql_num_rows($result) > 0) 
	{
        return 1;
    }
    else {
        return 0;
    
} */
}

Function isrepeated($date,$empid ,$db){

$date=date("Y-m-d", strtotime($date));
 $result = mysql_query("SELECT * FROM  `prldailytrans` WHERE employeeid='".$empid."' AND `rtdate` = '$date'");
    if (mysql_num_rows($result) > 0) 
	{
        return 1;
    }
    else {
        return 0;
    
}

}

Function repeatedate($date){

foreach ($_SESSION['RTDetail']->RTEntries as $RTItem)
 {

if(($RTItem->RTDate)==$date)
{

return 0;

}
}

return 1;
}


Function Emprepeatedate($date,$empid){

foreach ($_SESSION['RTDetail']->RTEntries as $RTItem)
 {

if((($RTItem->RTDate)==$date) &&  (($RTItem->EmployeeID)==$empid) )
{

return 0;

}
}

return 1;
}




Function employeePensionStatus($employeeid, $db){

/*Gets the GL Codes relevant to the stock item account from the stock category record */

    $QuerySQL = "SELECT deductsss FROM prlemployeemaster
	             WHERE employeeid = '$employeeid'";
	$ErrMsg =  _('The Employee code could not be retreived because');
	$GetPayDescResult = DB_query($QuerySQL, $db, $ErrMsg);

	$myrow = DB_fetch_array($GetPayDescResult);
	return $myrow[1];
}

Function GetOthIncRow($OIID, $db,$PayRow){

/*Gets the GL Codes relevant to the stock item account from the stock category record */
    $sql = "SELECT othincdesc,taxable FROM prlothinctable
	             WHERE othincid = '$OIID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow[$PayRow];;			 


}

Function GetApprover($empid,$level, $db){

/*Gets the GL Codes relevant to the stock item account from the stock category record */
    $sql = "SELECT approverid FROM prlemployeeapprover
	             WHERE active=1 AND levelid='".$level."' AND  employeeid= '".$empid."'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['approverid'];			 


}


Function CheckEmployeLeaveBalance($empid,$days,$leavetype, $db){

$balance=0;

    $sql = "SELECT approverid FROM prlemployeeapprover
	             WHERE active=1 AND levelid='".$level."' AND  employeeid= '".$empid."'";
	             $sql = "SELECT `id`,`employeeid`,`leavetype`,`startcycle`,`endcycle`,`totaldays`,`daysassigned`,`daystaken`,`status` ,`amountcarried`
	              FROM `leave_cycle`
				 WHERE status=0 AND  employeeid= '".$empid."' AND  leavetype= '".$leavetype."'
				ORDER BY id desc";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);

			$balance=(($myrow['daysassigned'] + $myrow['amountcarried']) - $myrow['daystaken']);

            return $balance;			 


}

//update balance
function daysTaken($empid,$leavetype,$daytaken,$db)
{

	$sql1 = "SELECT daystaken as days FROM  leave_cycle
	           WHERE employeeid = '".$empid."' AND leavetype='".$leavetype."' AND status=0";
			$result1 = DB_query($sql1, $db);
			$myrow1= DB_fetch_array($result1);
            $prev=$myrow1['days'];		
			$daystaken1=$prev+$daystaken;	
			return $daystaken1;
}

function updatEmployeeBalance($empid,$leavetype,$daytaken,$db)
{
	$previousdays=0;
$previousdays=daysTaken($empid,$leavetype,$daytaken,$db);
$totaldaystaken=$daytaken+$previousdays;
$sql = "UPDATE leave_cycle SET
									daystaken='".$totaldaystaken."'
									WHERE employeeid ='".$empid."' AND leavetype='".$leavetype."' AND status=0";
									DB_query($sql,$db);

}

//check Pending Leaves

Function CheckPendingLeaveForm($empid,$leavetype, $db){

/*Gets the GL Codes relevant to the stock item account from the stock category record */
    $sql = "SELECT count(id) as numid FROM  leave_application
	             WHERE  status='Pending' AND  leavetype= '".$leavetype."' AND employeeid='".$empid."' ";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['numid'];			 


}



Function GetLeaveType($type, $db){

/*Gets the GL Codes relevant to the stock item account from the stock category record */
    $sql = "SELECT id,`leave` FROM  leave_types
	             WHERE   id= ".$type;
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['leave'];			 


}

Function GetODCategory($OtheID, $db){
		$sql = "SELECT overheadid,overheaddesc
			FROM prloverheadstable
			WHERE overheadid= '$OtheID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['overheaddesc'];
}


Function GetApproverLevel($LevelID, &$db){

/*Gets the GL Codes relevant to the stock item account from the stock category record */

    $QuerySQL = "SELECT id,levelName FROM prlapproverlevel
	             WHERE id = '$LevelID'";
	$ErrMsg =  _('The Level Code Could not be retreived due to');
	$GetPayDescResult = DB_query($QuerySQL, $db, $ErrMsg);

	$myrow = DB_fetch_array($GetPayDescResult);
	return $myrow[1];
}

Function GetApproverLevelID($apprid, &$db){
		$sql = "SELECT levelid
			FROM prlapprovers
			WHERE id= '$apprid'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['levelid'];
}

Function GetOverHeadDesc($OtheID, $db){
		$sql = "SELECT overheadid,overheaddesc
			FROM prloverheadstable 
			WHERE overheadid= '$OtheID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['overheaddesc'];
}

Function GetOverheadSum($PayrollID, $db){
		$sql = "SELECT sum(amount) as overhead
			FROM prloverheadsfile
			WHERE headstype=2 AND payrollperiod= '$PayrollID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['overhead'];
}

Function GetODCRow($OIID, $db){

/*Gets the GL Codes relevant to the stock item account from the stock category record */
    $sql = "SELECT overheadid,overheaddesc FROM prloverheadstable
	             WHERE overheadid = '$OIID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['overheaddesc'];		 
}





Function GetTaxableIncRow($OIID, $db){

/*Gets the GL Codes relevant to the stock item account from the stock category record */
    $sql = "SELECT othincdesc,taxable FROM prlothinctable
	             WHERE othincid = '$OIID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['taxable'];			 
}
//update armotization for Percent Amount

function updateamortization($empid,$loanid,$percent, $amount,$PayrollID,$db)
{
	//$amortization=120000;
	//$amortization=GetPayrollTransRow($PayrollID,$empid ,$db);


	 $sql1 = "SELECT basicpay,grosspay FROM prlpayrolltrans
	             WHERE employeeid = '".$empid."' AND payrollid='".$PayrollID."'";
			$result = DB_query($sql1, $db);
			$myrow = DB_fetch_array($result);
            $amortization=($myrow['basicpay'] * $percent)/100;	

						 
$sql = "UPDATE prlloanfile SET
									amortization='" . $amortization . "'
									WHERE loanfileid = '".$loanid."'";
									$PostPrd = DB_query($sql,$db);

}


Function GetPayPeriodRow($PeriodID, $db,$PayRow){

/*Gets the GL Codes relevant to the stock item account from the stock category record */
    $sql = "SELECT payperiodid, payperioddesc,numberofpayday FROM prlpayperiod
	             WHERE payperiodid = '$PeriodID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow[$PayRow];;			 
}

//Fuction to Display Other Deduction in Reports Starts here 

Function GetOtherDedColums($PeriodID, $db){


    $sql = "SELECT payrollid,counterindex,employeeid,othincid,amount,othincdesc FROM prlotherdeductrans
                 LEFT JOIN prlothdedtable ON (prlotherdeductrans.otherincid=prlothdedtable.othincid)
	             WHERE prlotherdeductrans.payrollid = '$PeriodID'

	             GROUP BY othincid 
	             ORDER BY  othincid";
			$result = DB_query($sql, $db);
			while($myrow = DB_fetch_array($result))
			{
          echo "<th align='right'><font color='white'>".$myrow['othincdesc']."</font></th>";
           
			}		 
}

Function GetOtherDedColumsData($PeriodID,$employeeid,$db){


    $sql = "SELECT payrollid,counterindex,employeeid,othincid,amount,othincdesc FROM prlotherdeductrans
                 LEFT JOIN prlothdedtable ON (prlotherdeductrans.otherincid=prlothdedtable.othincid)
	             WHERE prlotherdeductrans.payrollid = '$PeriodID'

	             GROUP BY othincid 
	             ORDER BY  othincid";
			$result = DB_query($sql, $db);
			while($myrow = DB_fetch_array($result))
			{
            //echo "<th align='right'><font color='white'>".GetEmployeeOtherDeductData($PeriodID,$db,$employeeid,$myrow['amount'])."</font></th>";
             //echo "<td align='right'>".GetEmployeeOtherDeductData($PeriodID,$db,$employeeid,$myrow['othincid'])."</td>";
				//echo "<td align='right'>".$myrow['othincid']." -".$employeeid."- ".$PeriodID."</td>";
				echo "<td align='right'>".number_format(GetEmployeeOtherDeductData($PeriodID,$db,$employeeid,$myrow['othincid']),2)."</td>";
			}		 
}

Function GetEmployeeOtherDeductData($period,$db,$employee,$inctype)
{

		         $sql = "SELECT sum(amount) as amount FROM prlotherdeductrans
		                WHERE payrollid='".$period."' 
		                AND otherincid='".$inctype."'
		                AND  employeeid='". $employee."'";
			   
			    $result = DB_query($sql, $db);
			    $myrow = DB_fetch_array($result);
			
            return $myrow['amount'];
					 


}

Function GetOtherDedColumsDataSum($PeriodID,$employeeid,$db){

/*Gets column of Payroll register report*/
    $sql = "SELECT payrollid,counterindex,employeeid,othincid,amount,othincdesc FROM prlotherdeductrans
                 LEFT JOIN prlothdedtable ON (prlotherdeductrans.otherincid=prlothdedtable.othincid)
	             WHERE prlotherdeductrans.payrollid = '$PeriodID'

	             GROUP BY othincid 
	             ORDER BY  othincid";
			$result = DB_query($sql, $db);
			while($myrow = DB_fetch_array($result))
			{
            //echo "<th align='right'><font color='white'>".GetEmployeeOtherDeductData($PeriodID,$db,$employeeid,$myrow['amount'])."</font></th>";
             //echo "<td align='right'>".GetEmployeeOtherDeductData($PeriodID,$db,$employeeid,$myrow['othincid'])."</td>";
				//echo "<td align='right'>".$myrow['othincid']." -".$employeeid."- ".$PeriodID."</td>";
				echo "<th align='right'><font color='white'>".number_format(GetEmployeeOtherDeductDataSum($PeriodID,$db,$myrow['othincid']),2)."</font></th>";
			}		 
}

Function GetEmployeeOtherDeductDataSum($period,$db,$inctype)
{

		         $sql = "SELECT sum(amount) as amount FROM prlotherdeductrans
		                WHERE payrollid='".$period."' 
		                AND otherincid='".$inctype."'";
			   
			    $result = DB_query($sql, $db);
			    $myrow = DB_fetch_array($result);
			
            return $myrow['amount'];
					 


}

//function to Display Other deduction Columns ends here 

Function GetReportColums($PeriodID, $db){

/*Gets column of Payroll register report*/
    $sql = "SELECT payrollid,counterindex,employeeid,othincid,amount,othincdesc FROM prlothericometrans
                 LEFT JOIN prlothinctable ON (prlothericometrans.otherincid=prlothinctable.othincid)
	             WHERE prlothericometrans.payrollid = '$PeriodID'

	             GROUP BY othincid 
	             ORDER BY  othincid";
			$result = DB_query($sql, $db);
			while($myrow = DB_fetch_array($result))
			{
          echo "<th align='right'><font color='white'>".$myrow['othincdesc']."</font></th>";
           
			}		 
}

Function GetReportColumsData($PeriodID,$employeeid,$db){

/*Gets column of Payroll register report*/
    $sql = "SELECT payrollid,counterindex,employeeid,othincid,amount,othincdesc FROM prlothericometrans
                 LEFT JOIN prlothinctable ON (prlothericometrans.otherincid=prlothinctable.othincid)
	             WHERE prlothericometrans.payrollid = '$PeriodID'

	             GROUP BY othincid 
	             ORDER BY  othincid";
			$result = DB_query($sql, $db);
			while($myrow = DB_fetch_array($result))
			{
            //echo "<th align='right'><font color='white'>".GetEmployeeOtherIncomeData($PeriodID,$db,$employeeid,$myrow['amount'])."</font></th>";
             //echo "<td align='right'>".GetEmployeeOtherIncomeData($PeriodID,$db,$employeeid,$myrow['othincid'])."</td>";
				//echo "<td align='right'>".$myrow['othincid']." -".$employeeid."- ".$PeriodID."</td>";
				echo "<td align='right'>".number_format(GetEmployeeOtherIncomeData($PeriodID,$db,$employeeid,$myrow['othincid']),2)."</td>";
			}		 
}

Function GetEmployeeOtherIncomeData($period,$db,$employee,$inctype)
{

		         $sql = "SELECT sum(amount) as amount FROM prlothericometrans
		                WHERE payrollid='".$period."' 
		                AND otherincid='".$inctype."'
		                AND  employeeid='". $employee."'";
			   
			    $result = DB_query($sql, $db);
			    $myrow = DB_fetch_array($result);
			
            return $myrow['amount'];
					 


}

Function GetReportColumsDataSum($PeriodID,$employeeid,$db){

/*Gets column of Payroll register report*/
    $sql = "SELECT payrollid,counterindex,employeeid,othincid,amount,othincdesc FROM prlothericometrans
                 LEFT JOIN prlothinctable ON (prlothericometrans.otherincid=prlothinctable.othincid)
	             WHERE prlothericometrans.payrollid = '$PeriodID'

	             GROUP BY othincid 
	             ORDER BY  othincid";
			$result = DB_query($sql, $db);
			while($myrow = DB_fetch_array($result))
			{
            //echo "<th align='right'><font color='white'>".GetEmployeeOtherIncomeData($PeriodID,$db,$employeeid,$myrow['amount'])."</font></th>";
             //echo "<td align='right'>".GetEmployeeOtherIncomeData($PeriodID,$db,$employeeid,$myrow['othincid'])."</td>";
				//echo "<td align='right'>".$myrow['othincid']." -".$employeeid."- ".$PeriodID."</td>";
				echo "<th align='right'><font color='white'>".number_format(GetEmployeeOtherIncomeDataSum($PeriodID,$db,$myrow['othincid']),2)."</font></th>";
			}		 
}

Function GetEmployeeOtherIncomeDataSum($period,$db,$inctype)
{

		         $sql = "SELECT sum(amount) as amount FROM prlothericometrans
		                WHERE payrollid='".$period."' 
		                AND otherincid='".$inctype."'";
			   
			    $result = DB_query($sql, $db);
			    $myrow = DB_fetch_array($result);
			
            return $myrow['amount'];
					 


}
//get SSS Colums

Function GetSSSReportsColums($PeriodID, $db)
{

/*Gets column of Payroll register report*/
    $sql = "SELECT payrollid,counterindex,employeeid,penname FROM prlempsssfile
                 LEFT JOIN prlsstable ON (prlempsssfile.pencode=prlsstable.id)
	             WHERE prlempsssfile.payrollid = '$PeriodID'

	             GROUP BY prlempsssfile.pencode 
	             ORDER BY  penname ";
			$result = DB_query($sql, $db);
			while($myrow = DB_fetch_array($result))
			{
          echo "<th align='right'><font color='white'>".$myrow['penname']."</font></th>";
           
			}		 
}



Function GetEmployeeSSSAmount($period,$db,$employee,$pentype)
{

		         $sql = "SELECT sum(employeess) as amount FROM prlempsssfile
		                WHERE payrollid='".$period."' 
		                AND pencode='".$pentype."'
		                AND  employeeid='". $employee."'";
			   
			    $result = DB_query($sql, $db);
			    $myrow = DB_fetch_array($result);
			
            return $myrow['amount'];
					 


}



Function GetEmployeeTotalSSSAmount($period,$db,$pentype)
{

		         $sql = "SELECT sum(employeess) as amount FROM prlempsssfile
		                WHERE payrollid='".$period."' 
		                AND pencode='".$pentype."'";
			   
			    $result = DB_query($sql, $db);
			    $myrow = DB_fetch_array($result);
			
            return $myrow['amount'];
					 


}



Function DisplaySSSAmount($PeriodID,$employeeid,$db){

/*Gets column of Payroll register report*/
     $sql = "SELECT payrollid,counterindex,employeeid,penname,prlsstable.id as pencode FROM prlempsssfile
                 LEFT JOIN prlsstable ON (prlempsssfile.pencode=prlsstable.id)
	             WHERE prlempsssfile.payrollid = '$PeriodID'

	             GROUP BY prlempsssfile.pencode 
	             ORDER BY  penname ";
			$result = DB_query($sql, $db);
			while($myrow = DB_fetch_array($result))
			{
            
				echo "<td align='right'>".number_format(GetEmployeeSSSAmount($PeriodID,$db,$employeeid,$myrow['pencode']),2)."</td>";
				
			}		 
}



Function DisplayTotalSSSAmount($PeriodID,$db){

/*Gets column of Payroll register report*/
     $sql = "SELECT payrollid,counterindex,employeeid,penname,prlsstable.id as pencode FROM prlempsssfile
                 LEFT JOIN prlsstable ON (prlempsssfile.pencode=prlsstable.id)
	             WHERE prlempsssfile.payrollid = '$PeriodID'

	             GROUP BY prlempsssfile.pencode 
	             ORDER BY  penname ";
			$result = DB_query($sql, $db);
			while($myrow = DB_fetch_array($result))
			{
            
				
				echo "<th align='right'><font color='white'>".number_format(GetEmployeeTotalSSSAmount($PeriodID,$db,$myrow['pencode']),2)."</font></th>";
				
			}		 
}




//Function to get Loan Columns

Function GetLoanReportsColums($PeriodID, $db){

/*Gets column of Payroll register report*/
    $sql = "SELECT payrollid,counterindex,employeeid,prlloandeduction.loantableid as loantableid,amount,loantabledesc FROM prlloandeduction
                 LEFT JOIN prlloantable ON (prlloandeduction.loantableid=prlloantable.loantableid)
	             WHERE prlloandeduction.payrollid = '$PeriodID'

	             GROUP BY loantableid  
	             ORDER BY  loantableid ";
			$result = DB_query($sql, $db);
			while($myrow = DB_fetch_array($result))
			{
          echo "<th align='right'><font color='white'>".$myrow['loantabledesc']."</font></th>";
           
			}		 
}

//get employee Loan Amount

Function GetEmployeeLoanAmount($period,$db,$employee,$loantype)
{

		         $sql = "SELECT sum(amount) as amount FROM prlloandeduction
		                WHERE payrollid='".$period."' 
		                AND loantableid='".$loantype."'
		                AND  employeeid='". $employee."'";
			   
			    $result = DB_query($sql, $db);
			    $myrow = DB_fetch_array($result);
			
            return $myrow['amount'];
					 


}

//Display Loan in Reports as per columns
Function DisplayLoanAmount($PeriodID,$employeeid,$db){

/*Gets column of Payroll register report*/
     $sql = "SELECT payrollid,counterindex,employeeid,prlloandeduction.loantableid as loantableid,amount,loantabledesc FROM prlloandeduction
                 LEFT JOIN prlloantable ON (prlloandeduction.loantableid=prlloantable.loantableid)
	             WHERE prlloandeduction.payrollid = '$PeriodID'

	             GROUP BY loantableid  
	             ORDER BY  loantableid ";
			$result = DB_query($sql, $db);
			while($myrow = DB_fetch_array($result))
			{
            
				echo "<td align='right'>".number_format(GetEmployeeLoanAmount($PeriodID,$db,$employeeid,$myrow['loantableid']),2)."</td>";
			}		 
}



Function DisplayLoanAmountSum($PeriodID,$db){

/*Gets column of Payroll register report*/
    $sql = "SELECT payrollid,counterindex,employeeid,prlloandeduction.loantableid as loantableid,amount,loantabledesc FROM prlloandeduction
                 LEFT JOIN prlloantable ON (prlloandeduction.loantableid=prlloantable.loantableid)
	             WHERE prlloandeduction.payrollid = '$PeriodID'

	             GROUP BY loantableid  
	             ORDER BY  loantableid ";
			$result = DB_query($sql, $db);
			while($myrow = DB_fetch_array($result))
			{
				echo "<th align='right'><font color='white'>".number_format(GetEmployeeLoanAmountSum($PeriodID,$db,$myrow['loantableid']),2)."</font></th>";
			}		 
}

Function GetEmployeeLoanAmountSum($period,$db,$loantype)
{

		         $sql = "SELECT sum(amount) as amount FROM prlloandeduction
		                WHERE payrollid='".$period."' 
		                AND loantableid='".$loantype."'";
			   
			    $result = DB_query($sql, $db);
			    $myrow = DB_fetch_array($result);
			
            return $myrow['amount'];
					 


}

Function GetMyTax($MyTaxableIncome, $db){
	if ($MyTaxableIncome>0) {
		$sql = "SELECT rangefrom,rangeto,fixtaxableamount,fixtax,percentofexcessamount
				FROM prltaxtablerate
				WHERE rangefrom<='$MyTaxableIncome'
				AND rangeto>='$MyTaxableIncome'";
				$result = DB_query($sql, $db);
				$myrow = DB_fetch_array($result);
				$MyFixTax=$myrow['fixtax'];
				$rangeto=$myrow['rangeto'];
				$rangefro=$myrow['rangefrom'];
				$rangePerc=$myrow['percentofexcessamount'];
				
				$AA=$rangePerc/100;
				$BB=$MyTaxableIncome -$rangefro ;
				$CC=$AA*$BB;
				$deduct=$MyFixTax +$CC;
				
				
				
				//$MyTaxAmt=$MyFixTax+(($MyTaxableIncome-$myrow['fixtaxableamount'])*($myrow['percentofexcessamount']/100));
				
				//$MyTaxAmt=($MyTaxableIncome) - ($MyFixTax) - (($rangePerc/100)* ($MyTaxableIncome -$rangefro ) );
				$MyTaxAmt=$deduct;
				
				//$MyTaxAmt=$MyFixTax;
				//$MyTaxAmt=$MyFixTax;
				//$MyTaxAmt=$MyTaxableIncome;
				
	} else {
				$MyTaxAmt=0;
	}
	return $MyTaxAmt;
}

Function GetHDMFEE($GrossIncome, $db){
	$sql = "SELECT rangefrom,rangeto,dedtypeee,employeeshare
			FROM prlhdmftable
			WHERE rangefrom<='$GrossIncome'
			AND rangeto>='$GrossIncome'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			if ($myrow['dedtypeee']=='Fixed') {
				$MyHDMFAmt= $myrow['employeeshare'];
			} elseif ($myrow['dedtypeee']=='Percentage') {
				$MyHDMFAmt=$GrossIncome * ($myrow['employeeshare']/100);
			} else {
				$MyHDMFAmt= 0;
			}	
		    return $MyHDMFAmt;
}

Function GetHDMFER($GrossIncome, $db){
	$sql = "SELECT rangefrom,rangeto,dedtypeer,employershare
			FROM prlhdmftable
			WHERE rangefrom<='$GrossIncome'
			AND rangeto>='$GrossIncome'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			if ($myrow['dedtypeer']=='Fixed') {
				$MyHDMFAmt= $myrow['employeeshare'];
			} elseif ($myrow['dedtypeer']=='Percentage') {
				$MyHDMFAmt=$GrossIncome * ($myrow['employershare']/100);
			} else {
				$MyHDMFAmt= 0;
			}	
		    return $MyHDMFAmt;
}



Function GetTaxStatusRow($TaxID, $db,$PayRow){
		$sql = "SELECT taxstatusid,taxstatusdescription,personalexemption,additionalexemption,totalexemption
			FROM prltaxstatus
			WHERE taxstatusid='$TaxID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow[$PayRow];
}

        
Function GetPayrollRow($PayrollID, $db,$PayRow){
//payrollid - 0, and so on
/*Gets the GL Codes relevant to the stock item account from the stock category record */
		//$sql = "SELECT payrollidyrolldesc,payperiodid,startdate,enddate,fsmonth,fsyear,payclosed
		$sql = "SELECT payrollid,payrolldesc,payperiodid,startdate,enddate,fsmonth,fsyear,deductsss,deducthdmf,deductphilhealth,payclosed,financial_id
			FROM prlpayrollperiod
			WHERE id = '$PayrollID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			if ($PayRow==11) 
				return $myrow['payclosed']; 

			else if ($PayRow==12)
			 return $myrow['financial_id']; 
			else
            return $myrow[$PayRow];
}

//calculate basic dalary from  Transaction 

Function GetPayrollTransRow($PayrollID,$EmpID ,$db){
//payrollid - 0, and so on
/*Gets the GL Codes relevant to the stock item account from the stock category record */
		//$sql = "SELECT payrollidyrolldesc,payperiodid,startdate,enddate,fsmonth,fsyear,payclosed
		$sql = "SELECT payrollid,employeeid,basicpay
			FROM prlpayrolltrans
			
			WHERE payrollid='".$PayrollID."'  AND employeeid='". $EmpID."'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			
            return $myrow['basicpay'];
}


Function BasicPay($PayrollID,$EmpID ,$db){
//payrollid - 0, and so on
/*Gets the GL Codes relevant to the stock item account from the stock category record */
		//$sql = "SELECT payrollidyrolldesc,payperiodid,startdate,enddate,fsmonth,fsyear,payclosed
		$sql = "SELECT payrollid,employeeid,basicpay,grosspay
			FROM prlpayrolltrans
			
			WHERE payrollid='".$PayrollID."'  AND employeeid='". $EmpID."'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			
            return $myrow['grosspay'];
}


Function PayrollTransRow($PayrollID,$EmpID ,$db,$tran){
//payrollid - 0, and so on
/*Gets the GL Codes relevant to the stock item account from the stock category record */
		//$sql = "SELECT payrollidyrolldesc,payperiodid,startdate,enddate,fsmonth,fsyear,payclosed
		$sql = "SELECT payrollid,employeeid,basicpay,grosspay,tax,sss,netpay,pencode,totaldeduction,philhealth
			FROM prlpayrolltrans
			
			WHERE payrollid='".$PayrollID."'  AND employeeid='". $EmpID."'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			if($tran=="TAX")
			{
				return $myrow['tax'];
			}
			else  if($tran=="SSS")
			{
				return $myrow['sss'];
			}
			else  if($tran=="NETPAY")
			{
				return $myrow['netpay'];
			}

           else  if($tran=="TOTALDEDUCTION")
			{
				return $myrow['totaldeduction'];
			}

			else  if($tran=="NHIF")
			{
				return $myrow['philhealth'];
			}

			else  if($tran=="PENCODE")
			{
				return $myrow['pencode'];
			}
			else return 0;

            
}

Function OpenPeriod($db){

		$sql = 'SELECT payrollid, payrolldesc FROM prlpayrollperiod where payclosed=1';
			
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			
            return $myrow['payrollid'];
}




function excludess($period, $amount,$employeeid,$db){

	$sql = "SELECT isnssf FROM prlstatutorycheck WHERE employeeid='$employeeid'";
	//$sql = "SELECT employeeid FROM prlemployeemaster WHERE employeeid='$employeeid'"   period = '$period' and ;
	
	//$sql = "SELECT isNssf FROM prlemployeemaster WHERE employeeid='$employeeid'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
		$status=$myrow['isnssf'];
			if($status==1)
			return $amount;
			
			return 0;
}

function sayYesNo($no)
{
if($no==1) return YES;

return NO;
}

Function GetEmpRow($EmpID, $db,$EmpRow){
		$sql = "SELECT paytype,payperiodid,periodrate,hourlyrate,marital,taxstatusid,employmentid,active,ssnumber,hdmfnumber,phnumber,taxactnumber,atmnumber,employeecode,email1
			FROM prlemployeemaster
			WHERE employeeid= '$EmpID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			if ($EmpRow==35) return $myrow['taxstatusid'];
			if ($EmpRow==0) return $myrow['paytype'];
			if ($EmpRow==19) return $myrow['atmnumber'];
			if ($EmpRow==20) return $myrow['ssnumber'];
			if ($EmpRow==21) return $myrow['hdmfnumber'];
			if ($EmpRow==22) return $myrow['phnumber'];
			if ($EmpRow==23) return $myrow['taxactnumber'];
			if ($EmpRow==99) return $myrow['paytype'];
			if ($EmpRow==95) return $myrow['employeecode'];
			if ($EmpRow==96) return $myrow['email1'];

            return $myrow[$PayRow];
}


Function GetPayType($EmpID, $db){
		$sql = "SELECT paytype,employeeid
			FROM prlemployeemaster
			WHERE employeeid= '".$EmpID."'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			
			return $myrow['paytype'];
			

           
}


//get Employeees details from payroll transaction table 


Function GetEmpTransRow($EmpID, $db,$EmpRow){
		$sql = "SELECT paytype,payperiodid,periodrate,hourlyrate,marital,taxstatusid,employmentid,active,ssnumber,hdmfnumber,phnumber,taxactnumber,atmnumber
			FROM prlemployeemaster
			WHERE employeeid= '$EmpID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			if ($EmpRow==35) return $myrow['taxstatusid'];
			if ($EmpRow==29) return $myrow['paytype'];
			if ($EmpRow==19) return $myrow['atmnumber'];
			if ($EmpRow==20) return $myrow['ssnumber'];
			if ($EmpRow==21) return $myrow['hdmfnumber'];
			if ($EmpRow==22) return $myrow['phnumber'];
			if ($EmpRow==23) return $myrow['taxactnumber'];
            return $myrow[$PayRow];
}

Function GetEmpHoursTimesheet($EmpID,$date, $db){
		$sql = "SELECT reghrs,rtdate,employeeid
			    FROM prldailytrans 
			    WHERE rtdate='$date' AND  employeeid='$EmpID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
		    return $myrow['reghrs'];
} 

Function GetEmpTotalHoursTimesheet($EmpID,$period, $db){
		$sql = "SELECT sum(reghrs) as sumreghrs
			    FROM prldailytrans 
			    WHERE payrollid='$period' AND  employeeid='$EmpID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
		    return $myrow['sumreghrs'];
} 



Function GetName($EmpID, $db){
		$sql = "SELECT lastname,firstname,middlename,jobid
			FROM prlemployeemaster
			WHERE employeeid= '$EmpID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['firstname'].' '.$myrow['middlename'].' '.$myrow['lastname'];
}

Function employeePosition($EmpID, $db){
		$sql = "SELECT lastname,firstname,middlename,jobid
			FROM prlemployeemaster
			WHERE employeeid= '$EmpID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['jobid'];
}

Function employeeDetail($EmpID, $db,$column){
		$sql = "SELECT employeeid,employeecode,lastname,firstname,middlename,jobid,employeepicture
			FROM prlemployeemaster
			WHERE employeeid= '$EmpID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			if($column==0)
            return $myrow['employeeid'];
            else if($column==1)
            	 return $myrow['employeecode'];
            	 else if($column==2)
            	 return $myrow['firstname'];
            	 else if($column==3)
            	 return $myrow['lastname'];
            	 else if($column==4)
            	 return $myrow['middlename'];
            	 else if($column==5)
            	 return $myrow['jobid'];
            	 else if($column==6)
            	 return $myrow['employeepicture'];
            	 else 
            	 return "No Column";

}



Function GetDailyRate($EmpID, $db){
		$sql = "SELECT hourlyrate
			FROM prlemployeemaster
			WHERE employeeid= '$EmpID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['hourlyrate'];
}

Function GetEmpBankName($EmpID, $db){
		$sql = "SELECT bankid,employeeid
			FROM prlemployeemaster
			WHERE employeeid= '$EmpID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['bankid'];
}

//get Loan Type

Function GetLoanType($LoanID, $db){
		$sql = "SELECT loantableid,loantabledesc
			FROM prlloantable 
			WHERE loantableid= '$LoanID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['loantabledesc'];
}

//expense
Function GetExpenseDesc($OtheID, $db){
		$sql = "SELECT othincid,othincdesc
			FROM prlothinctable 
			WHERE othincid= '$OtheID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['othincdesc'];
}

Function GetODCdc($OtheID, $db){
		$sql = "SELECT odcid,odcdesc
			FROM prlodc
			WHERE odcid= '$OtheID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['odcdesc'];
}

function GetTotalPrioLoe($PeriodStartDate, $db){
//$PeriodStartDate=GetPayrollRow($period, $db,3);

		$sql = "SELECT employeeid,sum(reghours) as sb, sum(amount) as total,payrollid
			FROM prlemployeebudgettrans
			WHERE   madeat <'".$PeriodStartDate."'";
			
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			return $myrow['total'];
			
}

Function FringePrevPeriod($period,$db)
{
$PeriodStartDate=GetPayrollRow($period, $db,3);
$InsuPrevAmount=InsurancePrevPeriod($period,$db);
$sql = "SELECT employeeid,sum(sss) as pension, sum(wcf) as wcf ,sum(sdl) as sdl , sum(gratuity) as gratuity
			FROM prlpayrolltrans
			WHERE   madeat <'".$PeriodStartDate."'";
			
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			
			return $myrow['pension'] + $myrow['wcf'] +$myrow['sdl'] + $myrow['gratuity']+$InsuPrevAmount;
			//sreturn $InsuPrevAmount;
			

}

Function InsurancePrevPeriod($period,$db)
{
$PeriodStartDate=GetPayrollRow($period, $db,3);
$sql = "SELECT sum(amount) as amount
			FROM healthinsurance
			WHERE   madeat <'".$PeriodStartDate."'";
			
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			
			return $myrow['amount'];
			

}

Function GetOtherDirectSum($PayrollID, $db){
		$sql = "SELECT sum(amount) as overhead
			FROM prloverheadsfile
			WHERE headstype=1 AND payrollperiod= '$PayrollID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['overhead'];
}

Function OverheadPrevPeriod($period,$db)
{
$PeriodStartDate=GetPayrollRow($period, $db,3);

$sql = "SELECT sum(amount) amount
			FROM  prloverheadsfile
			WHERE  headstype=2 AND madeat <'".$PeriodStartDate."'";
			
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			
			return $myrow['amount'];
			//sreturn $InsuPrevAmount;
	

}


Function OtherPrevPeriod($period,$db)
{
$PeriodStartDate=GetPayrollRow($period, $db,3);

$sql = "SELECT sum(amount) amount
			FROM  prloverheadsfile
			WHERE  headstype=1 AND madeat <'".$PeriodStartDate."'";
			
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			
			return $myrow['amount'];
			//sreturn $InsuPrevAmount;
	

}


Function ExpensePrevPeriod($period,$db)
{
	$PrevVendor=0;
	$PrevExp=0;
	$PeriodStartDate=GetPayrollRow($period, $db,3);
	$PrevVendor=VendorPrevPeriod($period,$db);


$sql = "SELECT sum(othincamount) as amount
			FROM prloinvoicefile
			WHERE  approved=1 AND  madeat <'".$PeriodStartDate."'";
			
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			$PrevExp=$myrow['amount'];
			return $PrevExp  + $PrevVendor;
			//sreturn $InsuPrevAmount;
	

}


Function VendorPrevPeriod($period,$db)
{
$PeriodStartDate=GetPayrollRow($period, $db,3);

$sql = "SELECT sum(othincamount) amount
			FROM prlvendors
			WHERE   madeat <'".$PeriodStartDate."'";
			
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			
			return $myrow['amount'];
			//sreturn $InsuPrevAmount;
	

}

Function GetCurLEOSum($PayrollID, $db){
		$sql = "SELECT sum(basicpay) as loe
			FROM prlpayrolltrans
			WHERE  payrollid= '$PayrollID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['loe'];
}

Function GetTransportSum($PayrollID, $db){
		$sql = "SELECT sum(othincamount) as overhead
			FROM   prloinvoicefile
			WHERE approved=1 AND payrollid= '$PayrollID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);

			$sql2 = "SELECT sum(othincamount) as vendor
			FROM   prlvendors
			WHERE payrollid= '$PayrollID'";
			$result2 = DB_query($sql2, $db);
			$myrow2 = DB_fetch_array($result2);
            return $myrow['overhead'] + $myrow2['vendor'];
}


Function GetFringeSum($PayrollID, $db){

  $insurance=0;
  $insurance=GetInsuranceAmount($PayrollID,3, $db);
		$sql = "SELECT sum(gratuity) as gr, sum(sdl) as sdl ,sum(sss) as sss, sum(wcf) as wcf
			FROM  prlpayrolltrans 
			WHERE payrollid= '$PayrollID'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
            return $myrow['gr'] + $myrow['sdl']+ $myrow['sss'] + $myrow['wcf'] + $insurance;
}



Function GetBreakOBLAmount($id,$fy, $db){
		$sql = "SELECT obligatedamount,amount_initial
			FROM prlcompotentbreakdown
			WHERE id='".$id."' AND financial_id='".$fy."'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
		    return $myrow['obligatedamount'];
} 

Function GetBreakINAmount($id,$fy, $db){
		$sql = "SELECT obligatedamount,amount_initial
			FROM prlcompotentbreakdown
			WHERE id='".$id."' AND financial_id='".$fy."'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
		    return $myrow['amount_initial'];
} 


Function GetInsuranceAmount($Payrollid,$row, $db){
		$sql = "SELECT sum(qty) as quantity,sum(subamount) as sb, sum(amount) as total
			FROM healthinsurance
			WHERE periodid= '$Payrollid'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			if ($row==1)
			{
            //return $myrow['quantity'].', '.$myrow['sb'].', '.$myrow['total'];
			return $myrow['quantity'];
			}
			else if( $row==2)
			{
			return $myrow['sb'];
			}
			else if ($row==3)
			{
			return $myrow['total'];
			}
			else  return 0.00;
}

//Function get Initial Employee Budget

Function GetEmployeeBudg($EmpID,$row,$FinancialID, $db){
		$sql = "SELECT employeeid,sum(oblhours) as sb, sum(oblamount) as obl ,sum(initialhrs) as inhrs, sum(initialAmount) as inamount
			FROM prlemployeebudget
			WHERE employeeid= '".$EmpID."' and financial_id='".$FinancialID."'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			if ($row==1)
			{
           
			return $myrow['sb'];
			}
			
			else if ($row==2)
			{
			return $myrow['obl'];
			}
			
			else if ($row==3)
			{
			return $myrow['inhrs'];
			}
			else if ($row==4)
			{
			return $myrow['inamount'];
			}
		
			else  return 0.00;
}


Function GetEmployeeBudgSum($EmpID,$row,$FinancialID, $db){
		$sql = "SELECT employeeid,sum(oblhours) as sb, sum(oblamount) as obl ,sum(initialhrs) as inhrs, sum(initialAmount) as inamount
			FROM prlemployeebudget
			WHERE employmentid= '".$EmpID."' and financial_id='".$FinancialID."'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			if ($row==1)
			{
           
			return $myrow['sb'];
			}
			
			else if ($row==2)
			{
			return $myrow['obl'];
			}
			
			else if ($row==3)
			{
			return $myrow['inhrs'];
			}
			else if ($row==4)
			{
			return $myrow['inamount'];
			}
		
			else  return 0.00;
}
//get Ammount and Hours prior
function GetPrioAmountHours($EmpID,$row,$fy, $db){
		$sql = "SELECT employeeid,sum(reghours) as sb, sum(amount) as total
			FROM prlemployeebudgettrans
			WHERE   madeat >'2016-11-01' AND employeeid= '".$EmpID."' and financial_id='".$fy."'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			if ($row==1)
			{
           
			return $myrow['sb'];
			}
			
			else if ($row==2)
			{
			return $myrow['total'];
			}
			else  return 0.00;
}



Function GetSSSRow($ssscode, $db){
		$sql = "SELECT rangefrom,rangeto,salarycredit,employerss,employerec,employeess,total,penname,pencode
			FROM prlsstable
			WHERE
			id='$ssscode'";			
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
		    return $myrow;
}

Function ActiveEmployeeNumber($status, $db){
		$sql = "SELECT count(employeeid) as employees
			FROM prlemployeemaster
			WHERE active='".$status."'";
					
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
		    return $myrow['employees'];
}

Function RegisteredUsers($db){
		$sql = "SELECT count(userid) as employees
			FROM www_users
			";
					
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
		    return $myrow['employees'];
}

Function UnreadMessages($employee,$db){
		$sql = "SELECT count(id) as messages
			FROM prlmessages
			WHERE status=0 AND messageto='".$employee."'";
			
					
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
		    return $myrow['messages'];
}

Function SummeryMessages($employee,$db){
		$sql = "SELECT id,type,subject,messagefrom,messageto,message,status
			FROM prlmessages
			WHERE status=0 AND messageto='".$employee."'";
			
					
			$result = DB_query($sql, $db);
			while ($myrow = DB_fetch_array($result)) {
				?>
			 <div class="list-group-status status-online"></div>
                                    <img src="assets/images/users/no-image.jpg" class="pull-left" alt="John Doe"/>
                                    <span class="contacts-title"><?php echo $myrow['messagefrom'] ?></span>
                                    <p><?php echo $myrow['subject']; ?></p>
                                    <?php
		   }
}


Function TravelActivities($formid,$db){
		$sql = "SELECT id,type,subject,messagefrom,messageto,message,status
			FROM prlmessages
			WHERE status=0 AND messageto='".$employee."'";
			
					
			$result = DB_query($sql, $db);
			while ($myrow = DB_fetch_array($result)) {
				?>
			
                                    <li><?php echo $myrow['subject']; ?></li>
                                    <?php
		   }
}

Function TravelCost($formid,$db){
		$sql = "SELECT `counterindex`,`payrollid`,`othincid`,`quantity`,`subamount`,`othincamount`,`attachement` FROM `travel_cost`";
			
					
			$result = DB_query($sql, $db);
			while ($myrow = DB_fetch_array($result)) {
				
			
                                 echo  "<li>" .GetExpenseDesc($myrow['othincid'], $db)."</li>" ;
                                  
		   }
}



//function to check if Employeecode Exists

Function checkEmployee($empCode, $db){
		$sql = "SELECT employeeid
			FROM prlemployeemaster
			WHERE
			employeecode='$empCode'";			
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
		   // return $myrow;
			if($myrow > 0)
			return 0;
			return 1;
}

//form Number Function
Function formNumber($db){
		$sql = "SELECT count(id) as formnumber
			FROM  travel_request";			
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
		 return $myrow['formnumber']+1;
}

Function GetExpenseRow($PayrollID, $db,$Row,$EmpID,$ExpenceType){

		$sql = "SELECT payrollid,counterindex,othfileref,othfiledesc,employeeid,othdate,
		othincid,sum(quantity) as sumq,sum(subamount)as sumsub ,sum(othincamount) sumOther,accountcode
			FROM prloinvoicefile 
			WHERE approved=1 AND othincid='".$ExpenceType."' AND  employeeid='".$EmpID."' AND payrollid='" .$PayrollID. "'";

			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);

			if ($Row==1) return $myrow['sumq']; 

			else if ($Row==2) return $myrow['sumsub']; 
			
			else if ($Row==3) return $myrow['sumOther'];
           
            else return 0;
}


Function GetPHRow($PHGross, $db){
		$sql = "SELECT rangefrom,rangeto,salarycredit,employerph,employerec,employeeph,total
			FROM prlphilhealth
			WHERE rangefrom<='$PHGross'
			AND rangeto>='$PHGross'";
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
		    return $myrow;
}


Function periodClosed($period, $db){
		$sql = "SELECT `payrollid`,`payclosed` FROM `prlpayrollperiod` WHERE payrollid=".$period;
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
		    return $myrow['payclosed'];
}




function GetMonthStr($Mos)
{
		If ($Mos ==1) {
				$MosStr='January';
		} elseif ($Mos ==2){
				$MosStr='February';
		} elseif ($Mos ==3){
				$MosStr='March';
		} elseif ($Mos ==4){
				$MosStr='April';
		} elseif ($Mos ==5){
				$MosStr='May';				
		} elseif ($Mos ==6){
				$MosStr='June';				
		} elseif ($Mos ==7){
				$MosStr='July';				
		} elseif ($Mos ==8){
				$MosStr='August';				
		} elseif ($Mos ==9){
				$MosStr='September';				
		} elseif ($Mos ==10){
				$MosStr='October';				
		} elseif ($Mos ==11){
				$MosStr='November';				
		} elseif ($Mos ==12){
				$MosStr='December';				
		} else {
				$MosStr='Month';
		}  
      return $MosStr;
}

//unused
function monthoption($Mos)
{
   $MosStr= GetMonthStr($Mos);
   echo '<OPTION SELECTED VALUE=$Mos>'. _($MosStr);
   echo '<OPTION VALUE=1>' . _('January');
   echo '<OPTION VALUE=2>' . _('February');   
   echo '<OPTION VALUE=3>' . _('March');   
   echo '<OPTION VALUE=4>' . _('April');
   echo '<OPTION VALUE=5>' . _('May');
   echo '<OPTION VALUE=6>' . _('June');
   echo '<OPTION VALUE=7>' . _('July');
   echo '<OPTION VALUE=8>' . _('August');
   echo '<OPTION VALUE=9>' . _('September');
   echo '<OPTION VALUE=10>' . _('October');
   echo '<OPTION VALUE=11>' . _('November');
   echo '<OPTION VALUE=12>' . _('December');
   return 1;
}

//unsed
function yearoption($FSYear)
{
	if (($FSYear==0) or ($FSYear==null)) {
	    echo '<OPTION SELECTED VALUE=0>'. _('Year');
	} else {
	    echo '<OPTION SELECTED VALUE=$FSYear>'. _($FSYear);
	}
	for ($yy=2016;$yy<=2017;$yy++)
                    {
                        echo "<option value=$yy>$yy</option>\n";
                    	
                    }

  return 1;
}




//unused
function makedropdown($optionid,$optionname,$table)
{
	   // Query to choose all departments
	   $querydrop = "select $optionid,$optionname from $table order by $optionname"; 
       $resultdrop= MYSQL_QUERY($querydrop);
       $numberdrop = MYSQL_NUMROWS($resultdrop);           

           if ($numberdrop==0)
           {
           
               echo "<option value=\"\" selected>No Data</option>";	
           	
           }
           else if ($numberdrop>0)
           {
           
              $i=0;
              
                echo "<option value=\"\">Please Choose</option>";
                
                while ($i<$numberdrop)
                {
             
                       $opid = mysql_result($resultdrop,$i,"$optionid");
           	          $opname = mysql_result($resultdrop,$i,"$optionname");
                
                          echo "<option value=\"$opid\">$opname</option>\n";
                
                          $i++;

                }
       	
           }
           
           return 0;
}

function uploadProductImage($inputName, $uploadDir)
{
	$image     = $_FILES[$inputName];
	$imagePath = '';
	$thumbnailPath = '';
	
	// if a file is given
	if (trim($image['tmp_name']) != '') {
		$ext = substr(strrchr($image['name'], "."), 1); //$extensions[$image['type']];

		// generate a random new file name to avoid name conflict
		$imagePath = md5(rand() * time()) . ".$ext";
		
		list($width, $height, $type, $attr) = getimagesize($image['tmp_name']); 

		// make sure the image width does not exceed the
		// maximum allowed width
		if (LIMIT_PRODUCT_WIDTH && $width > MAX_PRODUCT_IMAGE_WIDTH) {
			$result    = createThumbnail($image['tmp_name'], $uploadDir . $imagePath, MAX_PRODUCT_IMAGE_WIDTH);
			$imagePath = $result;
		} else {
			$result = move_uploaded_file($image['tmp_name'], $uploadDir . $imagePath);
		}	
		
		if ($result) {
			// create thumbnail
			$thumbnailPath =  md5(rand() * time()) . ".$ext";
			$result = createThumbnail($uploadDir . $imagePath, $uploadDir . $thumbnailPath, THUMBNAIL_WIDTH);
			
			// create thumbnail failed, delete the image
			if (!$result) {
				unlink($uploadDir . $imagePath);
				$imagePath = $thumbnailPath = '';
			} else {
				$thumbnailPath = $result;
			}	
		} else {
			// the product cannot be upload / resized
			$imagePath = $thumbnailPath = '';
		}
		
	}

	
	return array('image' => $imagePath, 'thumbnail' => $thumbnailPath);
}

function createThumbnail($srcFile, $destFile, $width, $quality = 75)
{
	$thumbnail = '';
	
	if (file_exists($srcFile)  && isset($destFile))
	{
		$size        = getimagesize($srcFile);
		$w           = number_format($width, 0, ',', '');
		$h           = number_format(($size[1] / $size[0]) * $width, 0, ',', '');
		
		$thumbnail =  copyImage($srcFile, $destFile, $w, $h, $quality);
	}
	
	// return the thumbnail file name on sucess or blank on fail
	return basename($thumbnail);
}

/*
	Copy an image to a destination file. The destination
	image size will be $w X $h pixels
*/
function copyImage($srcFile, $destFile, $w, $h, $quality = 75)
{
    $tmpSrc     = pathinfo(strtolower($srcFile));
    $tmpDest    = pathinfo(strtolower($destFile));
    $size       = getimagesize($srcFile);

    if ($tmpDest['extension'] == "gif" || $tmpDest['extension'] == "jpg")
    {
       $destFile  = substr_replace($destFile, 'jpg', -3);
       $dest      = imagecreatetruecolor($w, $h);
       imageantialias($dest, TRUE);
    } elseif ($tmpDest['extension'] == "png") {
       $dest = imagecreatetruecolor($w, $h);
       imageantialias($dest, TRUE);
    } else {
      return false;
    }

    switch($size[2])
    {
       case 1:       //GIF
           $src = imagecreatefromgif($srcFile);
           break;
       case 2:       //JPEG
           $src = imagecreatefromjpeg($srcFile);
           break;
       case 3:       //PNG
           $src = imagecreatefrompng($srcFile);
           break;
       default:
           return false;
           break;
    }

    imagecopyresampled($dest, $src, 0, 0, 0, 0, $w, $h, $size[0], $size[1]);

    switch($size[2])
    {
       case 1:
       case 2:
           imagejpeg($dest,$destFile, $quality);
           break;
       case 3:
           imagepng($dest,$destFile);
    }
    return $destFile;

}



function uploadImage($inputName, $uploadDir)
{
    $image     = $_FILES[$inputName];
    $imagePath = '';
    
    // if a file is given
    if (trim($image['tmp_name']) != '') {
        // get the image extension
        $ext = substr(strrchr($image['name'], "."), 1); 

        // generate a random new file name to avoid name conflict
        $imagePath = md5(rand() * time()) . ".$ext";
        
		// check the image width. if it exceed the maximum
		// width we must resize it
		$size = getimagesize($image['tmp_name']);
		
		if ($size[0] > MAX_CATEGORY_IMAGE_WIDTH) {
			$imagePath = createThumbnail($image['tmp_name'], $uploadDir . $imagePath, MAX_CATEGORY_IMAGE_WIDTH);
		} else {
			// move the image to category image directory
			// if fail set $imagePath to empty string
			if (!move_uploaded_file($image['tmp_name'], $uploadDir . $imagePath)) {
				$imagePath = '';
			}
		}	
    }

    
    return $imagePath;
}



//number to word

function convert_number_to_words($number) {

    $hyphen      = '-';
    $conjunction = ' and ';
    $separator   = ', ';
    $negative    = 'negative ';
    $decimal     = ' cents ';
    $dictionary  = array(
        0                   => 'zero',
        1                   => 'one',
        2                   => 'two',
        3                   => 'three',
        4                   => 'four',
        5                   => 'five',
        6                   => 'six',
        7                   => 'seven',
        8                   => 'eight',
        9                   => 'nine',
        10                  => 'ten',
        11                  => 'eleven',
        12                  => 'twelve',
        13                  => 'thirteen',
        14                  => 'fourteen',
        15                  => 'fifteen',
        16                  => 'sixteen',
        17                  => 'seventeen',
        18                  => 'eighteen',
        19                  => 'nineteen',
        20                  => 'twenty',
        30                  => 'thirty',
        40                  => 'fourty',
        50                  => 'fifty',
        60                  => 'sixty',
        70                  => 'seventy',
        80                  => 'eighty',
        90                  => 'ninety',
        100                 => 'hundred',
        1000                => 'thousand',
        1000000             => 'million',
        1000000000          => 'billion',
        1000000000000       => 'trillion',
        1000000000000000    => 'quadrillion',
        1000000000000000000 => 'quintillion'
    );

    if (!is_numeric($number)) {
        return false;
    }

    if (($number >= 0 && (int) $number < 0) || (int) $number < 0 - PHP_INT_MAX) {
        // overflow
        trigger_error(
            'convert_number_to_words only accepts numbers between -' . PHP_INT_MAX . ' and ' . PHP_INT_MAX,
            E_USER_WARNING
        );
        return false;
    }

    if ($number < 0) {
        return $negative . convert_number_to_words(abs($number));
    }

    $string = $fraction = null;

    if (strpos($number, '.') !== false) {
        list($number, $fraction) = explode('.', $number);
    }

    switch (true) {
        case $number < 21:
            $string = $dictionary[$number];
            break;
        case $number < 100:
            $tens   = ((int) ($number / 10)) * 10;
            $units  = $number % 10;
            $string = $dictionary[$tens];
            if ($units) {
                $string .= $hyphen . $dictionary[$units];
            }
            break;
        case $number < 1000:
            $hundreds  = $number / 100;
            $remainder = $number % 100;
            $string = $dictionary[$hundreds] . ' ' . $dictionary[100];
            if ($remainder) {
                $string .= $conjunction . convert_number_to_words($remainder);
            }
            break;
        default:
            $baseUnit = pow(1000, floor(log($number, 1000)));
            $numBaseUnits = (int) ($number / $baseUnit);
            $remainder = $number % $baseUnit;
            $string = convert_number_to_words($numBaseUnits) . ' ' . $dictionary[$baseUnit];
            if ($remainder) {
                $string .= $remainder < 100 ? $conjunction : $separator;
                $string .= convert_number_to_words($remainder);
            }
            break;
    }

    if (null !== $fraction && is_numeric($fraction)) {
        $string .= $decimal;
        $words = array();
        foreach (str_split((string) $fraction) as $number) {
            $words[] = $dictionary[$number];
        }
        $string .= implode(' ', $words);
    }

    return $string;
}


//convert  Tsh

function amountIN_word($number)
{
//$number = 190908100.25;
   $no = round($number);
   $point = round($number - $no, 2) * 100;
   $hundred = null;
   $digits_1 = strlen($no);
   $i = 0;
   $str = array();
   $words = array('0' => '', '1' => 'one', '2' => 'two',
    '3' => 'three', '4' => 'four', '5' => 'five', '6' => 'six',
    '7' => 'seven', '8' => 'eight', '9' => 'nine',
    '10' => 'ten', '11' => 'eleven', '12' => 'twelve',
    '13' => 'thirteen', '14' => 'fourteen',
    '15' => 'fifteen', '16' => 'sixteen', '17' => 'seventeen',
    '18' => 'eighteen', '19' =>'nineteen', '20' => 'twenty',
    '30' => 'thirty', '40' => 'forty', '50' => 'fifty',
    '60' => 'sixty', '70' => 'seventy',
    '80' => 'eighty', '90' => 'ninety');
   $digits = array('', 'hundred', 'thousand', 'lakh', 'crore');
   while ($i < $digits_1) {
     $divider = ($i == 2) ? 10 : 100;
     $number = floor($no % $divider);
     $no = floor($no / $divider);
     $i += ($divider == 10) ? 1 : 2;
     if ($number) {
        $plural = (($counter = count($str)) && $number > 9) ? 's' : null;
        $hundred = ($counter == 1 && $str[0]) ? ' and ' : null;
        $str [] = ($number < 21) ? $words[$number] .
            " " . $digits[$counter] . $plural . " " . $hundred
            :
            $words[floor($number / 10) * 10]
            . " " . $words[$number % 10] . " "
            . $digits[$counter] . $plural . " " . $hundred;
     } else $str[] = null;
  }
  $str = array_reverse($str);
  $result = implode('', $str);
  $points = ($point) ?
    "." . $words[$point / 10] . " " . 
          $words[$point = $point % 10] : '';
  echo $result . "Rupees  " . $points . " Paise";
 }
 
 //from main tma
 
 Function GetInNumber($PeriodID, $db){
$PeriodStartDate=GetPayrollRow($PeriodID, $db,3);
		$sql = "SELECT count(distinct payrollid) as invnumber FROM prlpayrolltrans where madeat < '".$PeriodStartDate."'"  ;
			$result = DB_query($sql, $db);
			$myrow = DB_fetch_array($result);
			
			return $myrow['invnumber'] +15;
			

        
}
?>