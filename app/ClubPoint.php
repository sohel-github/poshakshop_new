<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ClubPoint extends Model
{
    public function user(){
    	return $this->belongsTo(user::class);
    }

    public function order(){
    	return $this->belongsTo(Order::class);
    }
}
