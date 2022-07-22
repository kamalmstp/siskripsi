<?php

namespace App\Models;

use GoldSpecDigital\LaravelEloquentUUID\Database\Eloquent\Uuid;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubmissionFinalRequirement extends Model
{
    use HasFactory, Uuid;
    protected $table = 'submission_of_final_requirements';

    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'nim', 'date_of_filling', 'response_date', 'status'
    ];

    public function details()
    {
        return $this->hasMany(SubmissionDetailsFinalRequirement::class, 'submission_id', 'id')
            ->with('final_requirement');
    }

    public function student()
    {
        return $this->belongsTo(Student::class, 'nim', 'nim')
            ->with(['study_program', 'user']);
    }

    public function scopeStatus($query, array $status)
    {
        return $query->whereIn('status', $status);
    }

    public static function getByStudentId($nim)
    {
        return self::where('nim', $nim)->withCount('details')->first();
    }
}
