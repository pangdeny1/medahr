<?php
/* $Revision: 1.17 $ */
// Display demo user name and password within login form if $allow_demo_mode is true
include ('includes/LanguageSetup.php');
$title=_('Login');
include('includes/ConnectDB.inc');
include('includes/SQL_CommonFunctions.inc');
include('includes/prlFunctions.php');

if ($allow_demo_mode == True AND !isset($demo_text)) {
    $demo_text = _('login as user') .': <i>' . _('demo') . '</i><BR>' ._('with password') . ': <i>' . _('anahaw') . '</i>';
} elseif (!isset($demo_text)) {
    $demo_text = _('Please login here');
}

if($_POST['Login'])
{
    if(empty($_POST['Password']))
    {
        $passworderror='Password is required';
    }


    if(empty($_POST['UserNameEntryField']))
    {
        $usernameerror='Username is required';
    }
}

?>

<html lang="en" class="body-full-height">
       
    <head>        
        <!-- META SECTION -->
        <title><?php echo $title; ?></title>  
        <meta http-equiv="Content-Type" content="text/html; charset=<?php echo _('ISO'); ?>" />          
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        
        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <!-- END META SECTION -->
        
        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="css/professional/theme-default.css"/>
        <!-- EOF CSS INCLUDE -->   

    </head>
    <body>
        
        <div class="login-container lightmode">
        
            <div class="login-box animated fadeInDown">
                <!--<div class="login-logo"></div> -->
                <div class="login-body">
                    <div class="login-title"><strong>Log In</strong> to your account <br><font color="Red"> </font></div>
                    <form action="<?php echo $_SERVER['PHP_SELF'];?>" class="form-horizontal" name="loginform" method="post">
                    <div class="form-group">
                        <div class="col-md-12">
                        	
                   	<?php
                    //if you have to hide company field style="visibility:hidden;"
						if ($AllowCompanySelectionBox == true){
							echo '<SELECT style="visibility:hidden;"  name="CompanyNameField" class="form-control">';
							$DirHandle = dir('companies/');
							while (false != ($CompanyEntry = $DirHandle->read())){
								if (is_dir('companies/' . $CompanyEntry) AND $CompanyEntry != '..' AND $CompanyEntry != 'CVS' AND $CompanyEntry!='.')
								{
									echo "<OPTION  VALUE='$CompanyEntry'>Company :: $CompanyEntry";
								}
							}
							echo '</SELECT>';
						} else {
                                         		echo '<INPUT type="TEXT" name="CompanyNameField"  VALUE="' . $DefaultCompany . '">';
						}
					?>
				</div>
			</div>
                    <div class="form-group">
                        <div class="col-md-12">
                           <input type="text" class="form-control" name="UserNameEntryField"  placeholder="username"/>
                           <span class="help-block"><font color="red"><?php echo $usernameerror; ?></font></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                          <input type="password" class="form-control" name="Password" placeholder="Password"/>
                          <span class="help-block"><font color="red"><?php echo $passworderror; ?></font></span>
                        </div>
                    </div>
                   
 
                    <div class="form-group">
                        <div class="col-md-6">
                            <a href="" class="btn btn-link btn-block">Register to Login</a>
                        </div>
                        <div class="col-md-6">
                           
                            <input type="submit" name='Login' class="btn btn-info btn-block" value="<?php echo _('Login'); ?>"  />
                        </div>
                    </div>
                    
                    
                   
                    </form>
                </div>
                <div class="login-footer">
                    <div class="pull-left">
                         <a href="http://www.ardoa.co.tz"> www.ardoa.co.tz<a>
                    </div>
                    <div class="pull-right">
                        <a href="#">About</a> |
                        <a href="#">Privacy</a> |
                        <a href="#">Contact Us</a>
                    </div>
                </div>
            </div>
            
        </div>
        
    </body>
</html>