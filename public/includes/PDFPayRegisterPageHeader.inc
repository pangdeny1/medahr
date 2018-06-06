<?php
	 
	$PageNumber++;
	if ($PageNumber>1){
		$pdf->newPage();
	}

	$FontSize =10;
	$pdf->selectFont('./fonts/Helvetica-Bold.afm');
	$YPos = $Page_Height - $Top_Margin;
	$YPos -= (4 * $line_height);
	$pdf->addText($Left_Margin,$YPos,$FontSize,$_SESSION['CompanyRecord']['coyname']);
	//$pdf->Image("images/logo.jpg", 300, 20, 100);

	$YPos -= $line_height;
	$FontSize =10;
	$pdf->selectFont('./fonts/Helvetica-Bold.afm');
	$Heading = _('Payroll Register for ') . $PayDesc;
	$pdf->addText($Left_Margin, $YPos, $FontSize, $Heading);
	$FontSize = 8;
	$pdf->selectFont('./fonts/Helvetica.afm');
	$pdf->addText($Page_Width-$Right_Margin-150,$YPos,$FontSize,
		_('Printed'). ': ' . Date($_SESSION['DefaultDateFormat'])
		. '   '. _('by'). ' ' .  $_SESSION['UsersRealName']. '   '. _('Page'). ' ' . $PageNumber  );
	$YPos -= (1 * $line_height);	
	$Heading1 = _('Period from ') . $FromPeriod .' to ' .$ToPeriod;
	$pdf->addText($Left_Margin,$YPos,$FontSize,$Heading1);

	$YPos -= (2 * $line_height);
	$LeftOvers = $pdf->addTextWrap($Left_Margin,$YPos,50,$FontSize,'EmpID');
	$LeftOvers = $pdf->addTextWrap(100,$YPos,120,$FontSize,'Full Name');
	$LeftOvers = $pdf->addTextWrap(231,$YPos,40,$FontSize,'Basic Pay','right');
	$LeftOvers = $pdf->addTextWrap(282,$YPos,50,$FontSize,'Pension','right');
	$LeftOvers = $pdf->addTextWrap(330,$YPos,50,$FontSize,'Taxable Earning','right');
	$LeftOvers = $pdf->addTextWrap(374,$YPos,50,$FontSize,'P.A.Y.E','right');
	//$LeftOvers = $pdf->addTextWrap(395,$YPos,50,$FontSize,'Ovetime','right');
	$LeftOvers = $pdf->addTextWrap(405,$YPos,50,$FontSize,'Other Deduction','right');
	$LeftOvers = $pdf->addTextWrap(465,$YPos,50,$FontSize,'Loan Deduction','right');			
	$LeftOvers = $pdf->addTextWrap(540,$YPos,50,$FontSize,'Net Pay','right');
	
	$LeftOvers = $pdf->line($Page_Width-$Right_Margin, $YPos,$Left_Margin, $YPos);
	$YPos -= (2 * $line_height);
	

?>