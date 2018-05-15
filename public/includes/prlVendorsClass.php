<?php
/* $Revision: 1.0 $ */

Class Overhead {

	var $OVEntries; /*array of objects class - id is the pointer */
	var $OVDate; /*Date to be processed */
	
	var $OVItemCounter; /*Counter for the number of entires being posted */
	var $OVItemID;
	var $OVTotal; /*Running total */

	function Overhead(){
	/*Constructor function initialises */
		$this->OVEntries = array();
		$this->OVItemCounter=0;
		$this->OVTotal=0;
		$this->OVItemID=0;
	}
	function Add_OVEntry($Amount, $SubAmount,$Quantity,$VName,$VDesc,$VCat){
		if ((isset($VName) AND $Amount!=0) OR (isset($VName) )) {
			$this->OVEntries[$this->OVItemID] = new OVAnalysis($this->OVItemID,$Amount, $SubAmount,$Quantity,$VName,$VDesc,$VCat);
			$this->OVItemCounter++;
			$this->OVItemID++;
			$this->OVTotal += $Amount;
			Return 1;
		}
		Return 0;
	}

	function remove_OVEntry($OI_ID){
		$this->OVTotal -= $this->OVEntries[$OI_ID]->Amount;
		unset($this->OVEntries[$OI_ID]);
		$this->OVItemCounter--;
	}

} /* end of class defintion */
Class OVAnalysis {
	var $Amount;
	
	var $SubAmount;
	var $Quantity;
	var $VDesc;
	var $VName;
	var $VCat;
	var $ID;

	function OVAnalysis ($id, $Oth,$Sa,$Quantity,$VName,$VDesc,$VCat)
	{

/* Constructor function to add a new  object with passed params */
		$this->Amount =$Oth;
		$this->SubAmount=$Sa;
		$this->Quantity=$Quantity;
		$this->VDesc=$VDesc;
		$this->VName = $VName;
		$this->VCat = $VCat;
		$this->ID = $id;
    }
}


?>