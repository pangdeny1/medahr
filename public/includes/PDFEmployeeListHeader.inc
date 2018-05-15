<?php
	$PageNumber++;
	if ($PageNumber>1){
		$pdf->newPage();
	}

	$FontSize =10;
	$pdf->selectFont('./fonts/Helvetica-Bold.afm');
	$YPos = $Page_Height - $Top_Margin;
	$pdf->addText($Left_Margin,$YPos,$FontSize,$_SESSION['CompanyRecord']['coyname']);
	$pdf->Image("images/logo.jpg", 300, 20, 100);

	$YPos -= $line_height;
	$FontSize =10;
	$pdf->selectFont('./fonts/Helvetica-Bold.afm');
	$Heading = _('Employee Listing ') ;
	$pdf->addText($Left_Margin, $YPos, $FontSize, $Heading);
	$FontSize = 8;
	$pdf->selectFont('./fonts/Helvetica.afm');
	$pdf->addText($Page_Width-$Right_Margin-120,$YPos,$FontSize,
		_('Printed'). ': ' . Date($_SESSION['DefaultDateFormat'])
		. '   '. _('Page'). ' ' . $PageNumber);
	$YPos -= (1 * $line_height);	
	$Heading1 = _('Period from ') . $FromPeriod .' to ' .$ToPeriod;
	$pdf->addText($Left_Margin,$YPos,$FontSize,$Heading1);
	
	$YPos -= (2 * $line_height);
	$LeftOvers = $pdf->addTextWrap($Left_Margin,$YPos,150,$FontSize,'No.');
	$LeftOvers = $pdf->addTextWrap($Left_Margin+50,$YPos,60,$FontSize,'EmpCode');
	$LeftOvers = $pdf->addTextWrap($Left_Margin+120,$YPos,150,$FontSize,'Full Name');
	$LeftOvers = $pdf->addTextWrap($Left_Margin+200,$YPos,50,$FontSize,'Date Hired','right');
	$LeftOvers = $pdf->addTextWrap($Left_Margin+270,$YPos,70,$FontSize,'End Of Contract','right');
	$LeftOvers = $pdf->addTextWrap($Left_Margin+410,$YPos,70,$FontSize,'Basic Salary','right');
	$LeftOvers = $pdf->line($Page_Width-$Right_Margin, $YPos,$Left_Margin, $YPos);
	$YPos -= (2 * $line_height);
	

?>