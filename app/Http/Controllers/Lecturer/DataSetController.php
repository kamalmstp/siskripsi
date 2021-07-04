<?php

namespace App\Http\Controllers\Lecturer;

use App\Http\Controllers\Controller;
use App\Models\DataSet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Rap2hpoutre\FastExcel\FastExcel;

class DataSetController extends Controller
{
    public function index()
    {
        $dataSets = DataSet::orderBy('nim', 'ASC')
            ->orderBy('thesis_year', 'ASC')
            ->get();

        return viewStudyProgramLeader('data-set.index', compact('dataSets'));
    }

    public function import(Request $request)
    {
        $this->validate($request, [
            'data-set' => 'required|file|mimes:xls,xlsx'
        ]);

        $dataSetFile = $request->file('data-set')->store('public/imports');
        $dataSetCollection = (new FastExcel)->import(storage_path('app/' . $dataSetFile));

        if($dataSetCollection->count() <= 0) {
            return redirect()->back()->with('message', [
                'type' => 'error',
                'text' => 'Pastikan Anda telah mengisi format data set tersebut!',
            ]);
        }

        $dataSetCollection->each(function ($row) {
            if($row['NIM'] !== '') {
                DataSet::create([
                    'nim'                       => $row['NIM'],
                    'student_name'              => $row['NAMA_MAHASISWA'],
                    'study_program_name'        => $row['PRODI'],
                    'thesis_year'               => $row['TAHUN_SKRIPSI'],
                    'research_title'            => $row['JUDUL'],
                    'science_field_name'        => $row['BIDANG_ILMU'],
                    'first_supervisor'          => $row['PEMBIMBING_1'],
                    'second_supervisor'         => $row['PEMBIMBING_2'],
                    'first_seminar_examiner'    => $row['PENGUJI_1_SEMINAR'],
                    'second_seminar_examiner'   => $row['PENGUJI_2_SEMINAR'],
                    'first_trial_examiner'      => $row['PENGUJI_1_SIDANG'],
                    'second_trial_examiner'     => $row['PENGUJI_2_SIDANG'],
                ]);
            }
        });

        $message = setFlashMessage('success', 'import', 'set');

        if (Storage::exists($dataSetFile)) {
            Storage::delete($dataSetFile);
        }

        return redirect()->route('leader.data-set.index')->with('message', $message);
    }
}
