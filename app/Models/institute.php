<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class institute extends Model
{
    protected $primaryKey='id';

    protected $table='institutes';
    protected $fillable = [
          
           'institutename','country','created_at','updated_at'
           ];
}
