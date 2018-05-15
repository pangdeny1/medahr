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
	$Heading = _('WORKERS COMPENSATION FUND (WCF) ') ;
	$pdf->addText($Left_Margin, $YPos, $FontSize, $Heading);
	$FontSize = 8;
	$pdf->selectFont('./fonts/Helvetica.afm');
	$pdf->addText($Page_Width-$Right_Margin-150,$YPos,$FontSize,
		 _('Page'). ' ' . $PageNumber  );
	$YPos -= (1 * $line_height);	
	$Heading1 = _('Employers Name: ') . $_SESSION['CompanyRecord']['coyname'];
	
	$pdf->addText($Left_Margin,$YPos,$FontSize,$Heading1);

	$YPos -= (2 * $line_height);
	$LeftOvers = $pdf->addTextWrap(50,$YPos,50,$FontSize,'S/N');
	$LeftOvers = $pdf->addTextWrap(100,$YPos,50,$FontSize,'Employee ID');
	$LeftOvers = $pdf->addTextWrap(200,$YPos,120,$FontSize,'Employee Name');
	$LeftOvers = $pdf->addTextWrap(331,$YPos,120,$FontSize,'Employee Basic Salary','right');
	
	$LeftOvers = $pdf->addTextWrap(465,$YPos,120,$FontSize,'Employee Gross Salary','right');
	
	$LeftOvers = $pdf->line($Page_Width-$Right_Margin, $YPos,$Left_Margin, $YPos);
	$YPos -= (2 * $line_height);
	

?>