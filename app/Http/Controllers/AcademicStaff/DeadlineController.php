<?php

namespace App\Http\Controllers\AcademicStaff;

use App\Http\Controllers\Controller;
use App\Models\Deadline;
use Illuminate\Http\Request;
use Ramsey\Uuid\Uuid;

class DeadlineController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $deadline = Deadline::all();
        return viewAcademicStaff('deadline.index', compact('deadline'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'form_name' => 'required',
            'time_start' => 'required',
            'time_end' => 'required'
        ]);

        $deadline = new Deadline();
        $deadline->name = $request->get('name');
        $deadline->form_name = $request->get('form_name');
        $deadline->time_start = $request->get('time_start');
        $deadline->time_end = $request->get('time_end');
        $deadline->status = $request->get('status');

        if($deadline->save()) {
            $message = setFlashMessage('success', 'insert', 'deadline');
        } else {
            $message = setFlashMessage('error', 'insert', 'deadline');
        }

        return redirect()->route('deadline.index')->with('message', $message);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Deadline  $deadline
     * @return \Illuminate\Http\Response
     */
    public function show(Deadline $deadline)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Deadline  $deadline
     * @return \Illuminate\Http\Response
     */
    public function edit(Deadline $deadline)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Deadline  $deadline
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required',
            'form_name' => 'required',
            'time_start' => 'required',
            'time_end' => 'required'
        ]);

        $deadline = Deadline::where('id', $id)->firstOrFail();
        $deadline->name = $request->get('name');
        $deadline->form_name = $request->get('form_name');
        $deadline->time_start = $request->get('time_start');
        $deadline->time_end = $request->get('time_end');
        $deadline->status = $request->get('status');

        if($deadline->update()) {
            $message = setFlashMessage('success', 'update', 'fakultas');
        } else {
            $message = setFlashMessage('error', 'update', 'fakultas');
        }

        return redirect()->route('deadline.index')->with('message', $message);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Deadline  $deadline
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $deadline = Deadline::where('id', $id)->firstOrFail();

        if($deadline->delete()) {
            $message = setFlashMessage('success', 'delete', 'fakultas');
        } else {
            $message = setFlashMessage('error', 'delete', 'fakultas');
        }

        return redirect()->route('deadline.index')->with('message', $message);
    }
}
