<?php

namespace App\Http\Controllers\Lecturer\Exam;

use App\Http\Controllers\Controller;
use App\Models\AssessmentComponent;
use App\Models\AssessmentScore;
use App\Models\SubmissionAssessment;
use Illuminate\Http\Request;

class ColloquiumController extends Controller
{
    public function score(SubmissionAssessment $submission)
    {
        $submission->load(['student', 'thesis']);
        $assessmentType = $submission->assessment_type;
        $components = AssessmentComponent::type($assessmentType)->get();

        return viewLecturer('exam.colloquium.score', compact('submission', 'components'));
    }

    public function inputScore(Request $request, SubmissionAssessment $submission)
    {
        $this->validate($request, [
            'scores' => 'required|array',
            'component_ids' => 'required|array'
        ]);

        $scores = $request->get('scores');
        $componentIds = $request->get('component_ids');

        $assessmentScore = null;
        for ($index = 1, $indexMax = count($scores); $index <= $indexMax; $index++) {
            $assessmentScore = AssessmentScore::create([
                'submission_assessment_id' => $submission->id,
                'assessment_component_id' => $componentIds[$index],
                'nidn' => auth()->user()->registration_number,
                'score' => $scores[$index]
            ]);
        }

        if ($assessmentScore) {
            $message = setFlashMessage('success', 'insert', 'nilai ujian kolokium skripsi');
        } else {
            $message = setFlashMessage('error', 'insert', 'nilai ujian kolokium skripsi');
        }

        return redirect()->route('lecturer.submission.colloquium.show', $submission->id)
            ->with('message', $message);
    }
}