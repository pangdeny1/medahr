<?php
$count=0;

$sql2="SELECT * FROM  prldailytrans WHERE (approved=0 OR verified=0) AND( approver='".$_SESSION['UsersRealName'] ."' OR verifyer='".$_SESSION['UsersRealName'] ."')
GROUP BY employeeid";
//$result=mysqli_query($conn, $sql2);
$result = DB_query($sql2, $db);
$count=DB_num_rows($result,$db);

$count3=0;
$sql3="SELECT * FROM   prloinvoicefile  WHERE (approved=0 OR verified=0) AND( approver='".$_SESSION['UsersRealName'] ."' OR verifyer='".$_SESSION['UsersRealName'] ."')
GROUP BY employeeid";

$result3 = DB_query($sql3, $db);
$count3=DB_num_rows($result3,$db);

/* $Revision: 1.27 $ */
	// Titles and screen header
	// Needs the file config.php loaded where the variables are defined for
	//  $rootpath
	//  $title - should be defined in the page this file is included with

	if (!headers_sent()){
		header('Content-type: text/html; charset=' . _('ISO-8859-1'));
	}
	
	?><!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="css/<?php echo $theme;?>/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="css/<?php echo $theme;?>/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title><?php echo $title; ?></title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="css/<?php echo $theme;?>/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="css/<?php echo $theme;?>/assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="css/<?php echo $theme;?>/assets/css/paper-dashboard.css" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="css/<?php echo $theme;?>/assets/css/demo.css" rel="stylesheet" />
	<link href="css/tcal.css" rel="stylesheet" />


    <!--  Fonts and icons     -->
    
    <link href="css/<?php echo $theme;?>/assets/css/themify-icons.css" rel="stylesheet">
	
	
	
	<?php
	//echo '<LINK HREF="'.$rootpath. '/css/'. $_SESSION['Theme'] .'/default.css" REL="stylesheet" TYPE="text/css">';
	echo '<LINK HREF="'.$rootpath. '/css/'. $_SESSION['Theme'] .'/tcal.css" REL="stylesheet" TYPE="text/css">';
	//echo '<LINK HREF="'.$rootpath. '/css/'. $_SESSION['Theme'] .'/style.css" REL="stylesheet" TYPE="text/css">';
	//echo '<LINK HREF="'.$rootpath. '/css/'. $_SESSION['Theme'] .'/emaster.css" REL="stylesheet" TYPE="text/css">';
   // echo '<LINK HREF="'.$rootpath. '/css/'. $_SESSION['Theme'] .'/admin.css" REL="stylesheet" TYPE="text/css">';


	//echo '<LINK HREF="'.$rootpath. '/css/'. $_SESSION['Theme'] .'/style2.css" REL="stylesheet" TYPE="text/css">';
	
    //  echo '<script src="' . $rootpath .'/js/jquery-1.12.4.js" language="JavaScript"></script>';
	 // echo '<script src="' . $rootpath .'/js/jquery-ui.js" language="JavaScript"></script>';
	
	
	echo '<script src="' . $rootpath .'/js/tcal.js" language="JavaScript"></script>';
	echo '<script src="' . $rootpath .'/js/ajax.js" language="JavaScript"></script>';
	echo '<script src="' . $rootpath .'/js/common.js" language="JavaScript"></script>';
	echo '<script src="' . $rootpath .'/js/jquery.js" language="JavaScript"></script>';
	echo '<script src="' . $rootpath .'/js/bootstrap1.js" language="JavaScript"></script>';
	echo '<script src="' . $rootpath .'/js/jquery.min.js" language="JavaScript"></script>';
	echo '<script src="' . $rootpath .'/js/bootstrap1.js" language="JavaScript"></script>';
	echo '<script src="' . $rootpath .'/js/bootstrap.js" language="JavaScript"></script>';
	
	echo '<script src="' . $rootpath .'/js/jquery.dataTables.js" language="JavaScript"></script>';
	echo '<script src="' . $rootpath .'/js/DT_bootstrap.js" language="JavaScript"></script>';
	
    
	
	
	
	?>
	
	

</head>

<body>

<div class="wrapper">
    <div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="" class="simple-text">
                
                <img width=50% height=50% src="images/logo/logo.jpg" alt="..."/>
                                 
                              
                </a>
				<hr>
				<center><b><a href="prlChangePassword.php" >User : <?php echo $_SESSION['UserID'];  ?></a> </b></center><!--<center><a href="prlChangePassword.php" >Change Password </a>--></center>
				
				
            </div>

            <ul class="nav">
                <li class="active">
                    <a href="index.php">
                        <i class="ti-panel"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li>
                    <?php echo "<a href='" . $rootpath . '/prlUserProfile.php?' . SID . "'>"; ?>
                        <i class="ti-user"></i>
                        <p>User Profile</p>
                    </a>


                </li>
                <li>
                    <?php echo "<a href='" . $rootpath . '/prlRegTimeEntry.php?' . SID . "'>"; ?>
                        <i class="ti-view-list-alt"></i>
                        <p>Timesheet </p>
                    </a>
					
                </li>
                <li>
                    <?php echo "<a href='" . $rootpath . '/prlCreateInvoice.php?' . SID . "'>"; ?>
                        <i class="ti-text"></i>
                        <p>Invoice</p>
                    </a>
                </li>
							<li>
					
				
                    <?php echo "<a href='" . $rootpath . '/prlReportEmployeeInvoice.php?' . SID . "'>"; ?>
                        <i class="ti-text"></i>
                        <p>Invoice Report</p>
                    </a>
                </li>
				
						<li>
					
				
                    <?php echo "<a href='" . $rootpath . '/prlRepPaySlip.php?' . SID . "'>"; ?>
                        <i class="ti-text"></i>
                        <p>Pay Slip Report</p>
                    </a>
					
					
                </li>
				
					<li>
				
                    <?php echo "<a href='" . $rootpath . '/prlRepCombinedPaySlip.php?' . SID . "'>"; ?>
                        <i class="ti-text"></i>
                        <p>Combined Bank Deposit Payslip</p>
                    </a>
                </li>
               <li >
                    <?php echo "<a href='" . $rootpath . '/prlReportTimesheet.php?' . SID . "'>"; ?>
                        <i class="ti-text"></i>
                        <p>Timesheet Report</p>
                    </a>
					
                </li>
				
				<li >
                    <?php echo "<a href='" . $rootpath . '/prlPayroll.php?' . SID . "'>"; ?>
                        <i class="ti-text"></i>
                        <p>Payroll</p>
                    </a>
					
                </li>
               
              
            </ul>
    	</div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#"><?php echo $_SESSION['CompanyRecord']['coyname'];?></a>
                </div>
                <div class="collapse navbar-collapse">
				
				
                    <ul class="nav navbar-nav navbar-right">
					 <li class="dropdown">
                              <a href="approvetimesheet.php" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="ti-bell"></i>
                                    <p class="notification"><font color='red' ><?php if($count>0) { echo $count; } ?></font></p>
									<p>Approve/Verify Timesheet</p>
									<b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu">
                                <?php
								$sql_n = "SELECT t.employeeid,e.firstname,e.lastname, sum(reghrs)as hrs FROM prldailytrans t
								LEFT JOIN prlemployeemaster e ON t.employeeid=e.employeeid 
	                          WHERE (approved=0 OR verified=0) AND (approver='".$_SESSION['UsersRealName'] ."' OR verifyer ='".$_SESSION['UsersRealName'] ."')  GROUP BY e.employeeid limit 5";	
				 $result_n = DB_query($sql_n, $db);
			
$response='';
while($row=DB_fetch_array(($result_n))) {
	$response = $response . " 
	<li> <a href ='approvetimesheet.php' >".$row['firstname']." ".$row['lastname']."</a></li> ";
}
if(!empty($response)) {
	print $response;
}
else
{
echo "<a href ='approvetimesheet.php' ><li> View Approved/Rejected </a></li>";
}


								
								?>
                              </ul>
                        </li>
						
						 <ul class="nav navbar-nav navbar-right">
					 <li class="dropdown">
                              <a href="approveinvoice.php?" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="ti-bell"></i>
                                    <p class="notification"><font color='red' ><?php if($count3>0) { echo $count3; } ?></font></p>
									<p>Approve/Verify Invoice</p>
									<b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu">
							  
                                <?php
								$sql_n = "SELECT t.employeeid,e.firstname,e.lastname, sum(othincamount)as amount FROM prloinvoicefile t
								LEFT JOIN prlemployeemaster e ON t.employeeid=e.employeeid 
	                          WHERE (approved=0 OR verified=0) AND  (approver='".$_SESSION['UsersRealName'] ."' OR verifyer ='".$_SESSION['UsersRealName'] ."')  GROUP BY e.employeeid limit 5";	
				 $result_n = DB_query($sql_n, $db);
			
$response='';
while($row=DB_fetch_array(($result_n))) {
	$response = $response . " 
	<li> <a href ='approveinvoice.php?' >".$row['firstname']." ".$row['lastname']."</a></li> ";
}
if(!empty($response)) {
	print $response;
}
else
{
echo "<li> <a href ='approveinvoice.php?' >View Approved/Rejected </a></li>";
}


								
								?>
                              </ul>
                        </li>
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                               
								<p><?php echo "<A ACCESSKEY=\"0\" HREF=\"" . $rootpath . '/Logout.php?' . SID . "\" onclick=\"return confirm('" . _('Are you sure you wish to logout?') . "');\"> "  . ('Logout') . '</A>';  ?></p>
                            </a>
                      
						
                    

                </div>
            </div>
        </nav>
		<div class="card">
                            <div class="header">
                                <h6 class="title"><?php echo $title ; ?></h6>
                                <p class="category"></p>
                            </div>
                            <div class="content table-responsive table-full-width">
							

