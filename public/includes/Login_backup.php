<?php
/* $Revision: 1.17 $ */
// Display demo user name and password within login form if $allow_demo_mode is true
include ('includes/LanguageSetup.php');

include('includes/ConnectDB.inc');
include('includes/SQL_CommonFunctions.inc');
include('includes/prlFunctions.php');

if ($allow_demo_mode == True AND !isset($demo_text)) {
	$demo_text = _('login as user') .': <i>' . _('demo') . '</i><BR>' ._('with password') . ': <i>' . _('anahaw') . '</i>';
} elseif (!isset($demo_text)) {
	$demo_text = _('Please login here');
}

?><HTML>
<HEAD>
    <TITLE><?php echo $_SESSION['CompanyRecord']['coyname'];?></TITLE>
    <meta http-equiv="Content-Type" content="text/html; charset=<?php echo _('ISO'); ?>" />
    
	<link rel="stylesheet" href="css/<?php echo $theme;?>/screen.css" type="text/css" media="screen" title="default" />
</HEAD>




<!--  jquery core -->
<script src="js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>

<!-- Custom jquery scripts -->
<script src="js/jquery/custom_jquery.js" type="text/javascript"></script>

<!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
<script src="js/jquery/jquery.pngFix.pack.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
$(document).pngFix( );
});
</script>
</head>
<body id="login-bg"> 
 
<!-- Start: login-holder -->
<div id="login-holder">

	<!-- start logo -->
	<div id="logo-login">
		<a href=""></a>
	</div>
	<!-- end logo -->
	
	<div class="clear"></div>
	
	<!--  start loginbox ................................................................................. -->
	<div id="loginbox">
	
	<!--  start login-inner -->
	<div id="login-inner">
		<table border="0" cellpadding="0" cellspacing="0">
		<FORM action="<?php echo $_SERVER['PHP_SELF'];?>" name="loginform" method="post">
		
					<?php
						if ($AllowCompanySelectionBox == true){
							echo '<SELECT name="CompanyNameField"  style="visibility:hidden;"  >';
							$DirHandle = dir('companies/');
							while (false != ($CompanyEntry = $DirHandle->read())){
								if (is_dir('companies/' . $CompanyEntry) AND $CompanyEntry != '..' AND $CompanyEntry != 'CVS' AND $CompanyEntry!='.'){
									echo "<OPTION  VALUE='$CompanyEntry'>$CompanyEntry";
								}
							}
							echo '</SELECT>';
						} else {
                                         		echo '<INPUT type="hidden" name="CompanyNameField"  VALUE="' . $DefaultCompany . '">';
						}
						?>
		<tr>
			<th>Username </th>
			<td><input type="text"  class="login-inp" name="UserNameEntryField"  /></td>
		</tr>
		<tr>
			<th>Password</th>
			<td><input type="password" value=""  name="Password" onFocus="this.value=''" class="login-inp" /></td>
		</tr>
		<tr>
			<th></th>
			<td valign="top"><input type="checkbox" class="checkbox-size" id="login-check" /><label for="login-check">Remember me</label></td>
		</tr>
		<tr>
			<th></th>
			<td><input type="submit" value="<?php echo _('Login'); ?>"  /></td>
		</tr>
		</FORM>
		</table>
	</div>
 	<!--  end login-inner -->
	<div class="clear"></div>
	<a href="" class="forgot-pwd">Forgot Password?</a>
 </div>
 <!--  end loginbox -->
 
	<!--  start forgotbox ................................................................................... -->
	<div id="forgotbox">
		<div id="forgotbox-text">Please send us your email and we'll reset your password.</div>
		<!--  start forgot-inner -->
        <?
		/*
		if (isset($_POST['recoverpassword'])) {
        
        $email= $_POST['email'];
        
		
		$sql = "SELECT password,userid FROM www_users WHERE email='".$email."'";
					$results = DB_query($sql,$db);
					
					$myrow=DB_fetch_array($results);
					
					prnMsg(_('Congratulations You have successfully changed your password' ),'success');
					echo "User Name is" .$myrow[0]." and Password ".$myrow[1];
					
					}
					else echo " N way"; */
					
	if (isset($_POST['recoverpassword'])) {
		$connect=mysql_connect("localhost","root","");	
		mysql_select_db("tma",$connect);		

$email=$_POST['email'];
$email=mysql_real_escape_string($email);
$status = "OK";
$msg="";
//error_reporting(E_ERROR | E_PARSE | E_CORE_ERROR);
// You can supress the error message by un commenting the above line
if (!stristr($email,"@") OR !stristr($email,".")) {
$msg="Your email address is not correct<BR>"; 
$status= "NOTOK";}


echo "<br><br>";
if($status=="OK"){ // validation passed now we will check the tables
$query="SELECT password,userid FROM www_users WHERE email='".$email."'";
$st=mysql_query($query);
$recs=mysql_num_rows($st);
$row=mysql_fetch_array($st);
$em=$row->email;// email is stored to a variable
if ($recs == 0) { // No records returned, so no email address in our table
// let us show the error message
echo "<center><font face='Verdana' size='2' color=red><b>No Password</b><br>
Sorry Your address is not there in our database . You can signup and login to use our site. 
<BR><BR><a href='signup.php'> Sign UP </a> </center>"; 
exit;}

$message ="Username :".$row['userid']." and Password : ". $row['password']."";
sendMailNot($to,$subject,$message,$from);
//mail($to,$subject,$message,$from);

}

	}	?>
        <form action="" method="post">
		<div id="forgot-inner">
		<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<th>Email address:</th>
			<td><input type="mail" value="<?=$_POST['mail'] ; ?>" name="email"   class="login-inp" /></td>
		</tr>
		<tr>
			<th> </th>
			<td><input type="submit" name="recoverpassword" name="recoverypassword" class="submit-login"/></td>
		</tr>
		</table>
        </form>
		</div>
		<!--  end forgot-inner -->
		<div class="clear"></div>
		<a href="" class="back-login">Back to login</a>
	</div>
	<!--  end forgotbox -->

</div>
<!-- End: login-holder -->
</body>
</html>