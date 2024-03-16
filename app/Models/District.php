<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class District extends Model
{
    protected $fillable = ['division_id', 'name'];

    public function division(){
        return $this->belongsTo(Division::class);
    }

    public function area(){
        return $this->hasMany(Area::class);
    }
}