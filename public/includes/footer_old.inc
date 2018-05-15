<?php

?>
        <footer class="footer">
		<hr>
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>

                       
                        
                        <li>
                        
     <?php                              
	if ($DefaultClock==12) {
		$hour=date('g:i a');
	} else {
		$hour=date('H:i');
	}
	;
	echo '<FONT SIZE=2>' .ucfirst(strftime('%A ') . date($_SESSION['DefaultDateFormat'] . ' | g:i A')) . '</FONT>';
	?>
                         
                        </li>
                    </ul>
                </nav>
                <div class="copyright pull-right">
                    TMA &copy; <script>document.write(new Date().getFullYear())</script> </i> 
                </div>
            </div>
        </footer>

    </div>
</div>


</body>

    <!--   Core JS Files   -->
    <script src="js/assets/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="js/assets/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="js/assets/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="js/assets/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="js/assets/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="js/assets/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="js/assets/demo.js"></script>

	<script type="text/javascript">
    	$(document).ready(function(){

        	demo.initChartist();

        	$.notify({
            	icon: 'ti-gift',
            	message: "Welcome to <b>Paper Dashboard</b> - a beautiful Bootstrap freebie for your next project."

            },{
                type: 'success',
                timer: 4000
            });

    	});
	</script>

</html>
<?php

?>
