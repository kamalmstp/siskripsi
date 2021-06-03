<?php

namespace App\Models;

use GoldSpecDigital\LaravelEloquentUUID\Database\Eloquent\Uuid;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubmissionThesisRequirement extends Model
{
    use HasFactory, Uuid;
    protected $table = 'submission_of_thesis_requirements';

    public $incrementing = false;

    protected $fillable = [
        'nim', 'date_of_filling', 'response_date', 'status'
    ];
}
