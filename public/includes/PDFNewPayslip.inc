<?php
	 
	$PageNumber++;
	if ($PageNumber>1){
		$pdf->newPage();
	}

	$FontSize =10;
	$pdf->selectFont('./fonts/Helvetica-Bold.afm');
	$YPos = $Page_Height - $Top_Margin;
	
	//$pdf->Image("images/logo.jpg", 300, 20, 100);

	$YPos -= $line_height;
	$FontSize =10;
	$pdf->selectFont('./fonts/Helvetica-Bold.afm');
	$Heading = _('Salary Slip') ;
	$pdf->addText(30, $YPos, $FontSize, $Heading);
	$FontSize = 8;
	$pdf->selectFont('./fonts/Helvetica.afm');
	$pdf->addText($Page_Width-$Right_Margin-150,$YPos,$FontSize,
		 _('Page'). ' ' . $PageNumber  );
	$YPos -= (1 * $line_height);	
	$Heading1 = _('Employer: ') . $_SESSION['CompanyRecord']['coyname'];
	$YPos -= $line_height;
	
				$FontSize =10;
				$pdf->selectFont('./fonts/Helvetica-Bold.afm');
				
	$pdf->addText(30,$YPos,$FontSize,$Heading1);

	
	
	
	
	

?>