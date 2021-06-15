<?php

namespace App\Models;

use GoldSpecDigital\LaravelEloquentUUID\Database\Eloquent\Uuid;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ScienceField extends Model
{
    use HasFactory, Uuid;

    public $incrementing = false;
    public $timestamps = false;

    protected $fillable = ['code', 'name'];

    public static function generateCode()
    {
        $lastCode = self::max('code') + 1;
        return str_pad($lastCode, 4, 0, STR_PAD_LEFT);

    }
}
