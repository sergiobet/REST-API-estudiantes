<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Student extends Model
{
    protected $table = 'student';

    protected $fillable = [
        'name',
        'email',
        'phone',
        'birth_date',
        'address',
        'city',
        'state',
        'zip_code',
        'country',
    ];

    use SoftDeletes;
}
