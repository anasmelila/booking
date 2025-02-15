<?php

namespace App\Models; // Ensure the correct namespace

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable {
    use HasFactory;

    protected $fillable = ['name', 'email', 'password'];

    public function bookings() {
        return $this->hasMany(Booking::class);
    }
}
