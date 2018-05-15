<?php
/* $Revision: 1.0 $ */

Class OthIncome {

	var $OIEntries; /*array of objects class - id is the pointer */
	var $OIDate; /*Date to be processed */
	var $OIType;
	var $OIItemCounter; /*Counter for the number of entires being posted */
	var $OIItemID;
	var $OITotal; /*Running total */

	function OthIncome(){
	/*Constructor function initialises */
		$this->OIEntries = array();
		$this->OIItemCounter=0;
		$this->OITotal=0;
		$this->OIItemID=0;
	}
	function Add_OIEntry($Amount, $SubAmount,$Quantity,$ODCID,$OIID,$OIIDDesc){
		if ((isset($ODCID) AND $Amount!=0) OR (isset($ODCID) )) {
			$this->OIEntries[$this->OIItemID] = new OIAnalysis($this->OIItemID,$Amount, $SubAmount,$Quantity, $ODCID, $LastName, $FirstName,$OIID,$OIIDDesc);
			$this->OIItemCounter++;
			$this->OIItemID++;
			$this->OITotal += $Amount;
			Return 1;
		}
		Return 0;
	}

	function remove_OIEntry($OI_ID){
		$this->OITotal -= $this->OIEntries[$OI_ID]->Amount;
		unset($this->OIEntries[$OI_ID]);
		$this->OIItemCounter--;
	}

} /* end of class defintion */
Class OIAnalysis {
	var $Amount;
	var $ODCID;
	var $SubAmount;
	var $Quantity;
	var $LastName;
	var $FirstName;
	var $OIID;
	var $OIIDDesc;
	var $ID;

	function OIAnalysis ($id, $Oth,$Sa,$Quantity,$Empcode,$OthID,$OthDesc){

/* Constructor function to add a new  object with passed params */
		$this->Amount =$Oth;
		$this->SubAmount=$Sa;
		$this->Quantity=$Quantity;
		$this->ODCID = $Empcode;
		$this->LastName = $Last;
		$this->FirstName = $First;
		$this->OIID = $OthID;
		$this->OIIDDesc = $OthDesc;
		$this->ID = $id;
    }
}


?>