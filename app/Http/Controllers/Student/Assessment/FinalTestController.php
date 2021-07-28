<?php

namespace App\Http\Controllers\Student\Assessment;

use App\Constants\AssessmentTypes;
use App\Http\Controllers\Controller;
use App\Models\AssessmentScore;
use App\Models\SubmissionAssessment;
use App\Models\Thesis;
use App\Services\Downloads\SubmissionAssessmentService;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class FinalTestController extends Controller
{
    public function index()
    {
        $nim = auth()->user()->registration_number;
        $submission = SubmissionAssessment::with('schedule')
            ->type(AssessmentTypes::TRIAL)
            ->studentId($nim)
            ->first();

        return viewStudent('final-test.index', compact('submission'));
    }

    public function submission()
    {
        $nim = auth()->user()->registration_number;
        $submission = SubmissionAssessment::type(AssessmentTypes::TRIAL)
            ->studentId($nim);

        $approvedSubmission = $submission->approved()->first();
        $appliedSubmission = $submission->first();

        if ($approvedSubmission) {
            return redirect()->back()
                ->with('message', [
                    'type' => 'warning',
                    'text' => 'Pengajuan sidang Anda telah disetujui oleh Pembimbing. Anda tidak dapat mengajukan sidang kembali.',
                    'timer' => 5000,
                ]);
        }

        if ($appliedSubmission && !$submission->isApplied()) {
            return redirect()->back()
                ->with('message', [
                    'type' => 'warning',
                    'text' => 'Anda tidak dapat melakukan pengajuan sidang lagi selama pengajuan sidang sebelumnya, belum direspon oleh kedua Dosen Pembibming',
                    'timer' => 5000,
                ]);
        }

        return viewStudent('final-test.submission-form');
    }

    public function apply(Request $request)
    {
        $this->validate($request, [
            'guidance_card_first_supervisor' => 'required|mimes:pdf',
            'guidance_card_second_supervisor' => 'required|mimes:pdf',
            'report' => 'required|mimes:pdf,doc,docx,zip,rar',
        ]);

        $nim = auth()->user()->registration_number;
        $thesis = Thesis::studentId($nim)->select('id')->first();

        $guidanceCardFirstSupervisor = $request->file('guidance_card_first_supervisor')->store('documents/guidance-cards');
        $guidanceCardSecondSupervisor = $request->file('guidance_card_second_supervisor')->store('documents/guidance-cards');
        $report = $request->file('report')->store('documents/seminar');

        $submissionAssessment = new SubmissionAssessment();
        $submissionAssessment->nim = $nim;
        $submissionAssessment->thesis_id = $thesis->id;
        $submissionAssessment->assessment_type = AssessmentTypes::TRIAL;
        $submissionAssessment->guidance_card_first_supervisor = $guidanceCardFirstSupervisor;
        $submissionAssessment->guidance_card_second_supervisor = $guidanceCardSecondSupervisor;
        $submissionAssessment->document = $report;

        if ($submissionAssessment->save()) {
            $message = setFlashMessage('success', 'create', 'pengajuan seminar');
        } else {
            $message = setFlashMessage('success', 'error', 'pengajuan seminar');
        }

        return redirect()->route('student.assessment.final-test.index')->with('message', $message);
    }

    public function show(SubmissionAssessment $submission)
    {
        $submission->load(['thesis']);
        return viewStudent('final-test.single', compact('submission'));
    }

    public function download(SubmissionAssessment $submission, $documentType)
    {
        $submissionAssessmentService = new SubmissionAssessmentService($submission);
        $filename = 'Laporan_Skripsi_Complete';

        if (Str::contains($documentType, 'first')) {
            $filename = 'Kartu_Bimbingan_1';
        }

        if (Str::contains($documentType, 'second')) {
            $filename = 'Kartu_Bimbingan_2';
        }

        return $submissionAssessmentService->setDocumentType($documentType)
            ->download($filename);
    }

    public function score()
    {
        $nim = auth()->user()->registration_number;
        $scores = AssessmentScore::with(['components'])
            ->whereHas('submission', function ($query) use ($nim) {
                $query->where('nim', $nim)
                    ->where('assessment_type', AssessmentTypes::TRIAL);
            })
            ->get();

        return viewStudent('final-test.score', compact('scores'));
    }
}
