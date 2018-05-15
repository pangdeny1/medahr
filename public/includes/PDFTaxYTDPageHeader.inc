<?php
	 
	$PageNumber++;
	if ($PageNumber>1){
		$pdf->newPage();
	}

	$FontSize =10;
	$pdf->selectFont('./fonts/Helvetica-Bold.afm');
	$YPos = $Page_Height - $Top_Margin;
	$YPos -= (4 * $line_height);
	$pdf->addText(300,$YPos,$FontSize,"P.A.Y.E. - DETAILS OF PAYMENT OF TAX WITHHELD
");
	
	$YPos -= $line_height;
	$FontSize =8;
	$pdf->selectFont('./fonts/Helvetica-Bold.afm');
	//$pdf->addText($Left_Margin,$YPos,$FontSize,"Name of Employer :".$_SESSION['CompanyRecord']['coyname']);
	$Heading = _("Name of Employer :".$_SESSION['CompanyRecord']['coyname']." TIN:".$_SESSION['CompanyRecord']['regoffice6'] );
	$pdf->addText($Left_Margin, $YPos, $FontSize, $Heading);
	$FontSize = 8;
	$pdf->selectFont('./fonts/Helvetica.afm');
	$pdf->addText($Page_Width-$Right_Margin-120,$YPos,$FontSize,
		_('Printed'). ': ' . Date($_SESSION['DefaultDateFormat'])
		. '   '. _('Page'). ' ' . $PageNumber);
	$YPos -= (1 * $line_height);	
	$Heading1 = _('For the Year : ') . $FSYear;
	$pdf->addText($Left_Margin,$YPos,$FontSize,$Heading1);

	$YPos -= (2 * $line_height);
	$LeftOvers = $pdf->addTextWrap($Left_Margin,$YPos,21,$FontSize,'S/NO.');
	$LeftOvers = $pdf->addTextWrap($Left_Margin+30,$YPos,120,$FontSize,'NAME OF EMPLOYEE');
	$LeftOvers = $pdf->addTextWrap(170,$YPos,70,$FontSize,'PAYROLL
	 NO.
');
	$LeftOvers = $pdf->addTextWrap(220,$YPos,70,$FontSize,'POSTAL ADDRESS','right');
	$LeftOvers = $pdf->addTextWrap(290,$YPos,70,$FontSize,'POSTAL CITY','right');
	$LeftOvers = $pdf->addTextWrap(360,$YPos,70,$FontSize,'BASIC PAY','right');
	$LeftOvers = $pdf->addTextWrap(410,$YPos,70,$FontSize,'HOUSING','right');
	$LeftOvers = $pdf->addTextWrap(500,$YPos,70,$FontSize,'ALLOWANCES','right');
	$LeftOvers = $pdf->addTextWrap(570,$YPos,70,$FontSize,'GROSS PAY','right');			
	$LeftOvers = $pdf->addTextWrap(630,$YPos,70,$FontSize,'DEDUCTIONS','right');
	$LeftOvers = $pdf->addTextWrap(695,$YPos,70,$FontSize,'TAXABLE AMOUNT','right');
	$LeftOvers = $pdf->addTextWrap(760,$YPos,70,$FontSize,'TAX DUE','right');
	$LeftOvers = $pdf->line($Page_Width-$Right_Margin, $YPos,$Left_Margin, $YPos);
	$YPos -= (2 * $line_height);
	

?>