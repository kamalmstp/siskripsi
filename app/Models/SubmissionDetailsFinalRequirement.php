<?php

namespace App\Models;

use GoldSpecDigital\LaravelEloquentUUID\Database\Eloquent\Uuid;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubmissionDetailsFinalRequirement extends Model
{
    use HasFactory, Uuid;
    protected $table = 'submission_details_final_requirements';
    protected $keyType = 'string';

    public $incrementing = false;

    protected $fillable = [
        'submission_id', 'final_requirement_id', 'document'
    ];

    public function final_requirement()
    {
        return $this->belongsTo(FinalRequirement::class);
    }
}
