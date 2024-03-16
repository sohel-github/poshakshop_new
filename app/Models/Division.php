<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Division extends Model
{
    protected $fillable = ['country_id', 'name'];

    public function country(){
        return $this->belongsTo(Country::class);
    }

    public function district(){
        return $this->hasMany(District::class);
    }
}