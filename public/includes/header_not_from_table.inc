<!DOCTYPE html>
<html lang="en">
    <head>        
        <!-- META SECTION -->
        <title><?php echo $title; ?></title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        
        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <!-- END META SECTION -->
        
        <!-- CSS INCLUDE -->        
        
        <link href="css/<?php echo $theme;?>/assets/theme-default.css" rel="stylesheet" />
        <?php echo '<LINK HREF="css/'. $_SESSION['Theme'] .'/tcal.css" REL="stylesheet" TYPE="text/css">';
         echo '<script src="' . $rootpath .'/js/tcal.js" language="JavaScript"></script>'; ?>

       
        <!-- EOF CSS INCLUDE -->                   
    </head>
    <body>
        <!-- START PAGE CONTAINER -->
         <?php  include('includes/prlFunctions.php'); ?>
        <div class="page-container">
            
            <!-- START PAGE SIDEBAR -->
            <div class="page-sidebar">
                <!-- START X-NAVIGATION -->
                <ul class="x-navigation">
                    <li class="xn-logo">
                        <a href="#"><font Color="white"><?php echo $_SESSION['CompanyRecord']['coyname'];?></font></a>
                        <a href="#" class="x-navigation-control"></a>
                    </li>
                    <li class="xn-profile">
                        <a href="#" class="profile-mini">
                            <img src="assets/images/users/avatar.jpg" alt="John Doe"/>
                        </a>
                        <div class="profile">
                            <div class="profile-image">
                                <img src="assets/images/users/<?php echo employeeDetail($_SESSION['UsersRealName'], $db,6) ?>" alt="<?php echo GetName($_SESSION['UsersRealName'],$db); ?>"/>
                            </div>
                            <div class="profile-data">
                               <!-- <div class="profile-data-name">Name: <?php echo GetName($_SESSION['UsersRealName'],$db); ?></div> -->
                                 <div class="profile-data-name">User : <?php echo $_SESSION['UserID']; ?></div>
                               <!-- <div class="profile-data-title"><?php echo employeePosition($_SESSION['UsersRealName'],$db); ?></div> -->
                            </div>
                            <div class="profile-controls">
                                <a href="prlUserProfile.php" class="profile-control-left"><span class="fa fa-info"></span></a>
                                <a href="pages-messages.html" class="profile-control-right"><span class="fa fa-envelope"></span></a>
                            </div>
                        </div>                                                                        
                    </li>
                    <li class="xn-title">Navigation</li>                    
                  <li class="xn-openable active">
                        <a href="#"><span class="fa fa-dashboard"></span> <span class="xn-text">Dashboards</span></a>
                        <ul>
                            <li class="active"><a href="index.php"><span class="xn-text">Main Dashboard</span></a></li>
                            <?php if(ismss($_SESSION['UserID'],$db)==1)
                      {
                     
                     ?>
                            <li class="active"><a href="prlPayroll.php"><span class="xn-text">Payroll Dashboard</span></a></li>

                            <?php
                        }
                        ?>
                            <li><a href="prlUserProfile.php"><span class="xn-text">User profile</span></a><div class="informer informer-danger">New!</div></li>
                            <li><a href="prlRegTimeEntry.php"><span class="xn-text">Time Sheet</span></a><div class="informer informer-danger">New!</div></li>
                            <li><a href="prlCreateInvoice.php"><span class="xn-text">Invoice</span></a><div class="informer informer-danger">New!</div></li>
                        </ul>
                    </li> 

                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-files-o"></span> <span class="xn-text">Employee Reports</span></a>
                        <ul>
                            <li><a href="prlRepPaySlip.php"><span class="fa fa-image"></span>Payslip</a></li>
                            <li><a href="prlReportEmployeeInvoice.php"><span class="fa fa-dollar"></span>Invoice Report</a></li>
                            <li><a href="prlRepCombinedPaySlip.php"><span class="fa fa-wrench"></span>Combined Bank Deposit</a></li>
                            
                        </ul>
                    </li>
                    <?php if(ismss($_SESSION['UserID'],$db)==1)
                      {
                     
                     ?>
                                   
                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-files-o"></span> <span class="xn-text">Maintanance</span></a>
                        <ul>
                            <li><a href="prlSelectEmployee.php"><span class="fa fa-image"></span>Add/UpdateEmployees Record</a></li>
                            <li><a href="prlTax.php"><span class="fa fa-dollar"></span>Add/Update Tax Table </a></li>
                            <li><a href="prlSelectTaxStatus.php"><span class="fa fa-wrench"></span> Add/Update tax Status Table</a></li>
                            <li><a href="prlSSS.php"><span class="fa fa-user"></span>Add/Update Social Security Table</a></li>
                            <li><a href="prlPH.php"><span class="fa fa-users"></span> Add/Update NHIF Table</a></li>
                            <li class="xn-openable">
                                <a href="prlHDMF.php"><span class="fa fa-clock-o"></span>Add/Update Workers Union Table</a>
                                <ul>
                                    <li><a href="prlEmploymentStatus.php"><span class="fa fa-align-center"></span>Add/update Employement Status</a></li>
                                    <li><a href="prlPayPeriod.php"><span class="fa fa-align-justify"></span> Add/update Pay Period Table</a></li>
                                </ul>
                            </li>
                            <li class="xn-openable">
                                <a href="prlOvertime.php"><span class="fa fa-envelope"></span>Add/Update Overtime Table</a>
                                <ul>
                                    <li><a href="prlHolidays.php"><span class="fa fa-inbox"></span>Add/Update Holidays</a></li>
                                    <li><a href="prlLoanTable.php"><span class="fa fa-file-text"></span>Add/Update Loan Table</a></li>
                                    <li><a href="prlOthIncTable.php"><span class="fa fa-pencil"></span>Add/Update Other Income Table</a></li>
                                </ul>
                            </li>
                            <li><a href="prlCostCenter.php"><span class="fa fa-comments"></span>Add/Update Cost Center</a></li>
                            <li><a href="CompanyPreferences.php"><span class="fa fa-calendar"></span>Company Preferences</a></li>
                            <li><a href="prlRepTakeBackup.php"><span class="fa fa-edit"></span>Database Backup</a></li>
                            <li><a href="timesheetApprovers.php"><span class="fa fa-columns"></span>Time Sheet Expense Approvers</a></li>
                            <li><a href="WWW_Users.php"><span class="fa fa-question-circle"></span>User Accounts</a></li>
                            <li><a href="WWW_Access.php"><span class="fa fa-search"></span>User Access</a></li>
                                                       
                        </ul>
                    </li>
                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-file-text-o"></span> <span class="xn-text">Payroll Transactions</span></a>
                        <ul>
                            <li><a href="prlSelectPayroll.php">Create/Modify/Edit Payroll</a></li>
                            <li><a href="prlSelectLoan.php">Employee loan Deduction Entry</a></li>
                            <li><a href="prlSelectHeslb.php">HESLB</a></li>
                            <li><a href="prlSelectAreas.php">Salary Areas/Bonus</a></li>
                            <li><a href="prlRegTimeEntryAll.php">Time Sheet Data Entry</a></li>
                            <li><a href="prlOtFile.php">Overtime Data Entry</a></li>
                            <li><a href="prlSelectAbsent.php">Absents Data Entry</a></li>
                            <li><a href="prlOthIncome.php">Other Income Data Entry</a></li>
                            <li><a href="prlSelectRTAll.php">View Time Sheet</a></li>
                            <li><a href="prlSelectOT.php">View Overtime</a></li>
                            <li><a href="prlSelectPayTrans.php">View Payroll Transaction</a></li>
                            <li><a href="prlSelectDeduction.php">View payroll Loan Deduction</a></li>
                            <li><a href="prlSelectHeslb.php">View HESLB Loan Deduction</a></li>
                            <li><a href="prlSelectOthIncome.php">View Other Income Data</a></li>
                          
                        </ul>
                    </li>
                   
                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-cogs"></span> <span class="xn-text">Invoice Transactions</span></a>                        
                        <ul>
                         <li> <a href="prlCreateInvoiceAll.php"><span class="fa fa-cogs"></span> <span class="xn-text">Create Invoice</span></a></li>
                            <li><a href="/prlCreateOverheads.php"><span class="fa fa-heart"></span>Create Overheads Expenses</a></li>                            
                            <li><a href="prlCreateVendors.php"><span class="fa fa-cogs"></span>Create Vendors Payment</a></li>
                            <li><a href="prlSelectOverheads"><span class="fa fa-square-o"></span>View Overheads Data</a></li>                            
                            <li><a href="prlSelectInvoiceAll.php"><span class="fa fa-pencil-square-o"></span>View Invoice</a></li>
                            <li><a href="prlSelectVendorPayment.php"><span class="fa fa-magic"></span>View Vendor Payment</a></li>
                            <li><a href="approvetimesheet.php"><span class="fa fa-magic"></span>Approve/Reject Timesheet</a></li>
                            <li><a href="approveinvoice.php"><span class="fa fa-pencil"></span>Approve/Reject Invoice</a></li>
                                           
                        </ul>
                    </li>                    
                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-pencil"></span> <span class="xn-text"> Inquiries and Reports
</span></a>
                        <ul>
                            <li class="xn-openable">
                                <a href="prlRepPayrollRegister.php"><span class="fa fa-tasks"></span>Payroll Register</a>                                
                                <ul>
                                    <li><a href="prlRepBankTrans.php"><span class="fa fa-align-justify"></span>Bank Transmittal</a></li>
                                    <li><a href="prlRepCashTrans.php"><span class="fa fa-th-large"></span>Cash Payment Listing</a></li>
                                    <li><a href="prlRepPaySlipAll.php"><span class="fa fa-table"></span>Pay Slip</a></li>
                                    <li><a href="prlRepCombinedPaySlipAll.php"><span class="fa fa-th-list"></span>Combined Bank Deposit Payslip</a></li>
                                </ul> 
                            </li>
                            <li><a href="prlRepSSSPremium.php"><span class="fa fa-file-text-o"></span> Pension Monthly Remittance</a><div class="informer informer-danger">New!</div></li>
                            <li><a href="prlRepTax.php"><span class="fa fa-list-alt"></span>Tax Monthly Return</a></li>
                            <li><a href="prlRepPHPremium.php"><span class="fa fa-arrow-right"></span>NHIF Monthly Remitance</a></li>
                            <li><a href="prlRepWcflRegister.php"><span class="fa fa-text-width"></span>Workers Compesation Fund(WCF)</a></li>
                            <li><a href="prlRepSdlRegister.php"><span class="fa fa-floppy-o"></span> Skills Development Levy(SDL)</a></li>
                             <li><a href="prlRepInvListRegister.php"><span class="fa fa-floppy-o"></span> Other Refundables</a></li>

                             <li><a href="prlRepPayrollRegYTD.php"><span class="fa fa-floppy-o"></span>Year To Date(YTD) Payroll Register</a></li>
                             <li><a href="prlRepTaxYTD.php"><span class="fa fa-floppy-o"></span> YTD tax</a></li>
                        </ul>
                    </li>
                    <li class="xn-openable">
                        <a href="tables.html"><span class="fa fa-table"></span> <span class="xn-text">Invoice Reports</span></a>
                        <ul>                            
                            
                            <li><a href="prlActualCost.php"><span class="fa fa-sort-alpha-desc"></span>Actual Cost Report</a></li>
                            <li><a href="prlInvoiceToDonor.php"><span class="fa fa-download"></span> Invoice to Donor</a></li>   
                             <li><a href="prlLabourClin.php"><span class="fa fa-download"></span>Labour & Clin Details</a></li>

                              <li><a href="prlReportTimesheetAll.php"><span class="fa fa-download"></span>Daily Timesheet</a></li>  
                               <li><a href="prlReportEmployeeInvoiceAll.php"><span class="fa fa-download"></span>Employee Invoice</a></li>  
                            
                               </ul>
                                    </li>
                                </ul>
                            </li>     
                                </ul>

                          
                            <?php 
}
                            ?>
                            </li>                            
                        </ul>
                    </li>                    
                </ul>
                <!-- END X-NAVIGATION -->
            </div>
            <!-- END PAGE SIDEBAR -->
            
            <!-- PAGE CONTENT -->
            <div class="page-content">
                
                <!-- START X-NAVIGATION VERTICAL -->
                <ul class="x-navigation x-navigation-horizontal x-navigation-panel">
                    <!-- TOGGLE NAVIGATION -->
                    <li class="xn-icon-button">
                        <a href="#" class="x-navigation-minimize"><span class="fa fa-dedent"></span></a>
                    </li>
                    <!-- END TOGGLE NAVIGATION -->
                    <!-- SEARCH -->
                    <li class="xn-search">
                        <form role="form">
                            <input type="text" name="search" placeholder="Search..."/>
                        </form>
                    </li>   
                    <!-- END SEARCH -->                    
                    <!-- POWER OFF -->
                    <li class="xn-icon-button pull-right last">
                        <a href="#"><span class="fa fa-power-off"></span></a>
                        <ul class="xn-drop-left animated zoomIn">
                           <!-- <li><a href="Logout.php"><span class="fa fa-lock"></span> Lock Screen</a></li>-->
                            <li><a href="#" class="mb-control" data-box="#mb-signout"><span class="fa fa-sign-out"></span> Sign Out</a></li>
                        </ul>                        
                    </li> 

                    <div class="message-box animated fadeIn" data-sound="alert" id="mb-signout">
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-sign-out"></span> Log <strong>Out</strong> ?</div>
                    <div class="mb-content">
                        <p>Are you sure you want to log out?</p>                    
                        <p>Press No if youwant to continue work. Press Yes to logout current user.</p>
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a href="Logout.php" class="btn btn-success btn-lg">Yes</a>
                            <button class="btn btn-default btn-lg mb-control-close">No</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                    <!-- END POWER OFF -->                    
                    <!-- MESSAGES -->
                    <li class="xn-icon-button pull-right">
                        <a href="#"><span class="fa fa-comments"></span></a>
                        <div class="informer informer-danger"><?php echo UnreadMessages($_SESSION['UsersRealName'],$db); ?></div>
                        <div class="panel panel-primary animated zoomIn xn-drop-left xn-panel-dragging">
                            <div class="panel-heading">
                                <h3 class="panel-title"><span class="fa fa-comments"></span> Messages</h3>                                
                                <div class="pull-right">
                                    <span class="label label-danger"><?php echo UnreadMessages($_SESSION['UsersRealName'],$db); ?> new</span>
                                </div>
                            </div>
                            <div class="panel-body list-group list-group-contacts scroll" style="height: 200px;">
                                <a href="#" class="list-group-item">
                                   <?php echo SummeryMessages($_SESSION['UsersRealName'],$db) ?>
                                </a>
                             
                              
                              
                            </div>     
                            <div class="panel-footer text-center">
                                <a href="#">Show all messages</a>
                            </div>                            
                        </div>                        
                    </li>
                    <!-- END MESSAGES -->
                    <!-- TASKS -->
                    <li class="xn-icon-button pull-right">
                        <a href="#"><span class="fa fa-tasks"></span></a>
                        <div class="informer informer-warning">3</div>
                        <div class="panel panel-primary animated zoomIn xn-drop-left xn-panel-dragging">
                            <div class="panel-heading">
                                <h3 class="panel-title"><span class="fa fa-tasks"></span> Tasks</h3>                                
                                <div class="pull-right">
                                    <span class="label label-warning">3 active</span>
                                </div>
                            </div>
                            <div class="panel-body list-group scroll" style="height: 200px;">                                
                                <a class="list-group-item" href="#">
                                    <strong>Project q</strong>
                                    <div class="progress progress-small progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%;">50%</div>
                                    </div>
                                    <small class="text-muted">Admin, 25 Sep 2017 / 50%</small>
                                </a>
                                                             
                            </div>     
                            <div class="panel-footer text-center">
                                <a href="#">Show all tasks</a>
                            </div>                            
                        </div>                        
                    </li>
                    <!-- END TASKS -->
                    <!-- LANG BAR -->
                    <li class="xn-icon-button pull-right">
                        <a href="#"><span class="flag flag-gb"></span></a>
                        <ul class="xn-drop-left xn-drop-white animated zoomIn">
                            <li><a href="#"><span class="flag flag-gb"></span> English</a></li>
                            <li><a href="#"><span class="flag flag-de"></span> Swahili</a></li>
                            
                        </ul>                        
                    </li> 
                    <!-- END LANG BAR -->
                </ul>
                <!-- END X-NAVIGATION VERTICAL -->                     

      