<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class F1 extends Model
{
    use HasFactory;
    protected $table = 'f1';
    protected $fillable = ['posisi','tim','desctim','point','logo'];
}
