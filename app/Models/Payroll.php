<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Payroll extends Model
{
    protected $primaryKey='id';

  protected $table='prlpayrollperiod';
    protected $fillable = [
          
           'payrollid',
           'payrolldesc',
           'payperiodid',
           'startdate',
           'enddate',
           'fsmonth'
           ,'fsyear'
           ,'deductsss'
           ,'deducthdmf'
           ,'deductphilhealth',
           'iscurrent',
           'updated_at'
           ];

}
