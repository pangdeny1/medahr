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
        <link rel="stylesheet" type="text/css" id="theme" href="css/theme-default.css"/>
        <!-- EOF CSS INCLUDE -->                   
    </head>
    <body>
        <!-- START PAGE CONTAINER -->
        <div class="page-container">
            
            <!-- START PAGE SIDEBAR -->
            <div class="page-sidebar">
                <!-- START X-NAVIGATION -->
                <ul class="x-navigation">
                    <li class="xn-logo">
                        <a href="index.html">ATLANT</a>
                        <a href="#" class="x-navigation-control"></a>
                    </li>
                    <li class="xn-profile">
                        <a href="#" class="profile-mini">
                            <img src="assets/images/users/avatar.jpg" alt="John Doe"/>
                        </a>
                        <div class="profile">
                            <div class="profile-image">
                                <img src="assets/images/users/avatar.jpg" alt="John Doe"/>
                            </div>
                            <div class="profile-data">
                                <div class="profile-data-name">John Doe</div>
                                <div class="profile-data-title">Developer/Designer</div>
                            </div>
                            <div class="profile-controls">
                                <a href="pages-profile.html" class="profile-control-left"><span class="fa fa-info"></span></a>
                                <a href="pages-messages.html" class="profile-control-right"><span class="fa fa-envelope"></span></a>
                            </div>
                        </div>                                                                        
                    </li>
                    <li class="xn-title">Navigation</li>
                    <li class="xn-openable active">
                        <a href="#"><span class="fa fa-dashboard"></span> <span class="xn-text">Dashboards</span></a>
                        <ul>
                            <li class="active"><a href="index.html"><span class="xn-text">Dashboard</span></a></li>
                            <li><a href="prlUserProfile.php"><span class="xn-text">User profile</span></a><div class="informer informer-danger">New!</div></li>
                            <li><a href="prlRegTimeEntry.php"><span class="xn-text">Time Sheet</span></a><div class="informer informer-danger">New!</div></li>
                            <li><a href="prlRegTimeEntry.php"><span class="xn-text">Invoice</span></a><div class="informer informer-danger">New!</div></li>
                        </ul>
                    </li>                    
                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-files-o"></span> <span class="xn-text">Maintanance</span></a>
                        <ul>
                            <li><a href="prlSelectEmployee.php"><span class="fa fa-image"></span>Add/UpdateEmployees Record</a></li>
                            <li><a href="pages-invoice.html"><span class="fa fa-dollar"></span>Add/Update Tax Table </a></li>
                            <li><a href="pages-edit-profile.html"><span class="fa fa-wrench"></span> Add/Update tax Status Table</a></li>
                            <li><a href="pages-profile.html"><span class="fa fa-user"></span>Add/Update Social Security Table</a></li>
                            <li><a href="pages-address-book.html"><span class="fa fa-users"></span> Add/Update NHIF Table</a></li>
                            <li class="xn-openable">
                                <a href="#"><span class="fa fa-clock-o"></span>Add/Update Workers Union Table</a>
                                <ul>
                                    <li><a href="pages-timeline.html"><span class="fa fa-align-center"></span>Add/update Employement Status</a></li>
                                    <li><a href="pages-timeline-simple.html"><span class="fa fa-align-justify"></span> Add/update Pay Period Table</a></li>
                                </ul>
                            </li>
                            <li class="xn-openable">
                                <a href="#"><span class="fa fa-envelope"></span>Add/Update Overtime Table</a>
                                <ul>
                                    <li><a href="pages-mailbox-inbox.html"><span class="fa fa-inbox"></span>Add/Update Holidays</a></li>
                                    <li><a href="pages-mailbox-message.html"><span class="fa fa-file-text"></span>Add/Update Loan Table</a></li>
                                    <li><a href="pages-mailbox-compose.html"><span class="fa fa-pencil"></span>Add/Update Other Income Table</a></li>
                                </ul>
                            </li>
                            <li><a href="pages-messages.html"><span class="fa fa-comments"></span>Add/Update Cost Center</a></li>
                            <li><a href="pages-calendar.html"><span class="fa fa-calendar"></span>Company Preferences</a></li>
                            <li><a href="pages-tasks.html"><span class="fa fa-edit"></span>Database Backup</a></li>
                            <li><a href="pages-content-table.html"><span class="fa fa-columns"></span>Time Sheet Expense Approvers</a></li>
                            <li><a href="pages-faq.html"><span class="fa fa-question-circle"></span>User Accounts</a></li>
                            <li><a href="pages-search.html"><span class="fa fa-search"></span>User Access</a></li>
                                                       
                        </ul>
                    </li>
                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-file-text-o"></span> <span class="xn-text">Payroll Transactions</span></a>
                        <ul>
                            <li><a href="layout-boxed.html">Create/Modify/Edit Payroll</a></li>
                            <li><a href="layout-nav-toggled.html">Employee loan Deduction Entry</a></li>
                            <li><a href="layout-nav-toggled-hover.html">HESLB</a></li>
                            <li><a href="layout-nav-toggled-item-hover.html">Salary Areas/Bonus</a></li>
                            <li><a href="layout-nav-top.html">Time Sheet Data Entry</a></li>
                            <li><a href="layout-nav-right.html">Overtime Data Entry</a></li>
                            <li><a href="layout-nav-top-fixed.html">Absents Data Entry</a></li>
                            <li><a href="layout-nav-custom.html">Other Income Data Entry</a></li>
                            <li><a href="layout-nav-top-custom.html">View Time Sheet</a></li>
                            <li><a href="layout-frame-left.html">View Overtime</a></li>
                            <li><a href="layout-frame-right.html">View Payroll Transaction</a></li>
                            <li><a href="layout-search-left.html">View payroll Loan Deduction</a></li>
                            <li><a href="layout-page-sidebar.html">View HESLB Loan Deduction</a></li>
                            <li><a href="layout-page-loading.html">View Other Income Data</a></li>
                          
                        </ul>
                    </li>
                   
                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-cogs"></span> <span class="xn-text">Invoice Transactions</span></a>                        
                        <ul>
                         <li> <a href="#"><span class="fa fa-cogs"></span> <span class="xn-text">Create Invoice</span></a></li>
                            <li><a href="ui-widgets.html"><span class="fa fa-heart"></span>Create Overheads Expenses</a></li>                            
                            <li><a href="ui-elements.html"><span class="fa fa-cogs"></span>Create Vendors Payment</a></li>
                            <li><a href="ui-buttons.html"><span class="fa fa-square-o"></span>View Overheads Data</a></li>                            
                            <li><a href="ui-panels.html"><span class="fa fa-pencil-square-o"></span>View Invoice</a></li>
                            <li><a href="ui-icons.html"><span class="fa fa-magic"></span>View Vendor Payment</a></li>
                            <li><a href="ui-icons.html"><span class="fa fa-magic"></span>Approve/Reject Timesheet</a></li>
                            <li><a href="ui-typography.html"><span class="fa fa-pencil"></span>Approve/Reject Invoice</a></li>
                                           
                        </ul>
                    </li>                    
                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-pencil"></span> <span class="xn-text"> Inquiries and Reports
</span></a>
                        <ul>
                            <li class="xn-openable">
                                <a href="form-layouts-two-column.html"><span class="fa fa-tasks"></span>Payroll Register</a>                                
                                <ul>
                                    <li><a href="form-layouts-one-column.html"><span class="fa fa-align-justify"></span>Bank Transmittal</a></li>
                                    <li><a href="form-layouts-two-column.html"><span class="fa fa-th-large"></span>Cash Payment Listing</a></li>
                                    <li><a href="form-layouts-tabbed.html"><span class="fa fa-table"></span>Pay Slip</a></li>
                                    <li><a href="form-layouts-separated.html"><span class="fa fa-th-list"></span>Combined Bank Deposit Payslip</a></li>
                                </ul> 
                            </li>
                            <li><a href="form-elements.html"><span class="fa fa-file-text-o"></span> Pension Monthly Remittance</a><div class="informer informer-danger">New!</div></li>
                            <li><a href="form-validation.html"><span class="fa fa-list-alt"></span>Tax Monthly Return</a></li>
                            <li><a href="form-wizards.html"><span class="fa fa-arrow-right"></span>NHIF Monthly Remitance</a></li>
                            <li><a href="form-editors.html"><span class="fa fa-text-width"></span>Workers Compesation Fund(WCF)</a></li>
                            <li><a href="form-file-handling.html"><span class="fa fa-floppy-o"></span> Skills Development Levy(SDL)</a></li>
                             <li><a href="form-file-handling.html"><span class="fa fa-floppy-o"></span> Other Refundables</a></li>

                             <li><a href="form-file-handling.html"><span class="fa fa-floppy-o"></span>Year To Date(YTD) Payroll Register</a></li>
                             <li><a href="form-file-handling.html"><span class="fa fa-floppy-o"></span> YTD tax</a></li>
                        </ul>
                    </li>
                    <li class="xn-openable">
                        <a href="tables.html"><span class="fa fa-table"></span> <span class="xn-text">Invoice Reports</span></a>
                        <ul>                            
                            <li><a href="table-basic.html"><span class="fa fa-align-justify"></span> Basic</a></li>
                            <li><a href="table-datatables.html"><span class="fa fa-sort-alpha-desc"></span>Actual Cost Report</a></li>
                            <li><a href="table-export.html"><span class="fa fa-download"></span> Invoice to Donor</a></li>   
                             <li><a href="table-export.html"><span class="fa fa-download"></span>Labour & Clin Details</a></li>

                              <li><a href="table-export.html"><span class="fa fa-download"></span>Daily Timesheet</a></li>  
                               <li><a href="table-export.html"><span class="fa fa-download"></span>Employee Invoice</a></li>  
                        </ul>
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
                            <li><a href="pages-lock-screen.html"><span class="fa fa-lock"></span> Lock Screen</a></li>
                            <li><a href="#" class="mb-control" data-box="#mb-signout"><span class="fa fa-sign-out"></span> Sign Out</a></li>
                        </ul>                        
                    </li> 
                    <!-- END POWER OFF -->                    
                    <!-- MESSAGES -->
                    <li class="xn-icon-button pull-right">
                        <a href="#"><span class="fa fa-comments"></span></a>
                        <div class="informer informer-danger">4</div>
                        <div class="panel panel-primary animated zoomIn xn-drop-left xn-panel-dragging">
                            <div class="panel-heading">
                                <h3 class="panel-title"><span class="fa fa-comments"></span> Messages</h3>                                
                                <div class="pull-right">
                                    <span class="label label-danger">4 new</span>
                                </div>
                            </div>
                            <div class="panel-body list-group list-group-contacts scroll" style="height: 200px;">
                                <a href="#" class="list-group-item">
                                    <div class="list-group-status status-online"></div>
                                    <img src="assets/images/users/user2.jpg" class="pull-left" alt="John Doe"/>
                                    <span class="contacts-title">John Doe</span>
                                    <p>Praesent placerat tellus id augue condimentum</p>
                                </a>
                                <a href="#" class="list-group-item">
                                    <div class="list-group-status status-away"></div>
                                    <img src="assets/images/users/user.jpg" class="pull-left" alt="Dmitry Ivaniuk"/>
                                    <span class="contacts-title">Dmitry Ivaniuk</span>
                                    <p>Donec risus sapien, sagittis et magna quis</p>
                                </a>
                                <a href="#" class="list-group-item">
                                    <div class="list-group-status status-away"></div>
                                    <img src="assets/images/users/user3.jpg" class="pull-left" alt="Nadia Ali"/>
                                    <span class="contacts-title">Nadia Ali</span>
                                    <p>Mauris vel eros ut nunc rhoncus cursus sed</p>
                                </a>
                                <a href="#" class="list-group-item">
                                    <div class="list-group-status status-offline"></div>
                                    <img src="assets/images/users/user6.jpg" class="pull-left" alt="Darth Vader"/>
                                    <span class="contacts-title">Darth Vader</span>
                                    <p>I want my money back!</p>
                                </a>
                            </div>     
                            <div class="panel-footer text-center">
                                <a href="pages-messages.html">Show all messages</a>
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
                                    <strong>Phasellus augue arcu, elementum</strong>
                                    <div class="progress progress-small progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%;">50%</div>
                                    </div>
                                    <small class="text-muted">John Doe, 25 Sep 2015 / 50%</small>
                                </a>
                                <a class="list-group-item" href="#">
                                    <strong>Aenean ac cursus</strong>
                                    <div class="progress progress-small progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;">80%</div>
                                    </div>
                                    <small class="text-muted">Dmitry Ivaniuk, 24 Sep 2015 / 80%</small>
                                </a>
                                <a class="list-group-item" href="#">
                                    <strong>Lorem ipsum dolor</strong>
                                    <div class="progress progress-small progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100" style="width: 95%;">95%</div>
                                    </div>
                                    <small class="text-muted">John Doe, 23 Sep 2015 / 95%</small>
                                </a>
                                <a class="list-group-item" href="#">
                                    <strong>Cras suscipit ac quam at tincidunt.</strong>
                                    <div class="progress progress-small">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">100%</div>
                                    </div>
                                    <small class="text-muted">John Doe, 21 Sep 2015 /</small><small class="text-success"> Done</small>
                                </a>                                
                            </div>     
                            <div class="panel-footer text-center">
                                <a href="pages-tasks.html">Show all tasks</a>
                            </div>                            
                        </div>                        
                    </li>
                    <!-- END TASKS -->
                    <!-- LANG BAR -->
                    <li class="xn-icon-button pull-right">
                        <a href="#"><span class="flag flag-gb"></span></a>
                        <ul class="xn-drop-left xn-drop-white animated zoomIn">
                            <li><a href="#"><span class="flag flag-gb"></span> English</a></li>
                            <li><a href="#"><span class="flag flag-de"></span> Deutsch</a></li>
                            <li><a href="#"><span class="flag flag-cn"></span> Chinese</a></li>
                        </ul>                        
                    </li> 
                    <!-- END LANG BAR -->
                </ul>
                <!-- END X-NAVIGATION VERTICAL -->                     

                <!-- START BREADCRUMB -->
                <ul class="breadcrumb">
                    <li><a href="#">Home</a></li>                    
                    <li class="active">Dashboard</li>
                </ul>
                <!-- END BREADCRUMB --> 
                <!-- MESSAGE BOX-->
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
        <!-- END MESSAGE BOX-->