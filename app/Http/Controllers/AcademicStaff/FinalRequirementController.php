<?php

namespace App\Http\Controllers\AcademicStaff;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Models\SubmissionFinalRequirement;
use App\Models\FinalRequirement;
use Illuminate\Http\Request;

class FinalRequirementController extends Controller
{
    public function index(Request $request)
    {
        if($request->has('status')) {
            if($request->get('status') === 'unresponse' || $request->get('status') === 'approve' || $request->get('status') === 'reject') {
                $status = $request->get('status') === 'unresponse' ? Status::APPLY : $request->get('status');
            } else {
                abort(404);
            }
        } else {
            $status = Status::APPLY;
        }

        $finalRequirements = FinalRequirement::all();
        $submissionFinalRequirements = SubmissionFinalRequirement::with(['student', 'details'])
            ->status([$status])
            ->orderByDesc('date_of_filling')
            ->get();

        return viewAcademicStaff('final-requirement.index', compact('finalRequirements', 'submissionFinalRequirements', 'status'));
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'document_name' => 'required',
            'document_type' => 'required'
        ]);

        $isRequired = $request->has('is-required') ? 1 : 0;

        $finalRequirement = [
            'document_name' => $request->get('document_name'),
            'document_type' => $request->get('document_type'),
            'note' => $request->get('note'),
            'is_required' => $isRequired
        ];

        $createFinalRequirement = FinalRequirement::create($finalRequirement);

        if($createFinalRequirement){
            $message = setFlashMessage('success', 'insert', 'persyaratan skripsi');
        } else {
            $message = setFlashMessage('error', 'insert', 'persyaratan skripsi');
        }

        return redirect()->route('final-requirements.index')->with('message', $message);
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'document_name' => 'required',
            'document_type' => 'required'
        ]);

        $isRequired = $request->has('is-required') ? 1 : 0;

        $finalRequirement = [
            'document_name' => $request->get('document_name'),
            'document_type' => $request->get('document_type'),
            'note' => $request->get('note'),
            'is_required' => $isRequired
        ];

        $updateFinalRequirement = FinalRequirement::where('id', $id)->update($finalRequirement);

        if($updateFinalRequirement){
            $message = setFlashMessage('success', 'update', 'persyaratan skripsi');
        } else {
            $message = setFlashMessage('error', 'update', 'persyaratan skripsi');
        }

        return redirect()->route('final-requirements.index')->with('message', $message);
    }

    public function destroy($id)
    {
        $finalRequirement = FinalRequirement::where('id', $id)->firstOrFail();
        if($finalRequirement->delete()) {
            $message = setFlashMessage('success', 'delete', 'persyaratan skripsi');
        } else {
            $message = setFlashMessage('error', 'delete', 'persyaratan skripsi');
        }

        return redirect()->route('final-requirements.index')->with('message', $message);
    }
}
