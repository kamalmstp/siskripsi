@extends('layouts.backend')

@section('content')
    <!-- Hero -->
    <div class="bg-body-light">
        <div class="content content-full">
            <div class="d-flex flex-column flex-sm-row justify-content-sm-between align-items-sm-center">
                <h1 class="flex-sm-fill font-size-h2 font-w400 mt-2 mb-0 mb-sm-2">Data Dosen</h1>
                <nav class="flex-sm-00-auto ml-sm-3" aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">Examples</li>
                        <li class="breadcrumb-item active" aria-current="page">Plugin</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <!-- END Hero -->

    <!-- Page Content -->
    <div class="content">
        <div class="row row-deck">
            <div class="col-sm-8">
                <div class="block block-rounded">
                    <div class="block-header block-header-default">
                        <h3 class="block-title">
                            <i class="fa fa-fw fa-download text-muted mr-1"></i>
                            Unggah Persyaratan Skripsi
                        </h3>
                    </div>
                    <div class="block-content">
                        <div class="row justify-content-center py-sm-3 py-md-5">
                            <form action="{{ route('lecturers.import') }}" method="POST"
                                  enctype="multipart/form-data">
                                @csrf
                                <div class="form-group">
                                    <label for="import-data-example">Sample Import Data</label>
                                    <a href="" class="btn btn-success btn-block">
                                        <i class="fa fa-download"></i>
                                        <span>Download Template</span>
                                    </a>
                                </div>

                                <div class="form-group">
                                    <label for="document">File</label>
                                    <div class="custom-file {{ ($errors->has('file')) ? 'is-invalid' : '' }}">
                                        <!-- Populating custom file input label with the selected filename (data-toggle="custom-file-input" is initialized in Helpers.coreBootstrapCustomFileInput()) -->
                                        <input type="file" class="custom-file-input js-custom-file-input-enabled {{ ($errors->has('file')) ? 'is-invalid' : '' }}"
                                               data-toggle="custom-file-input" id="dm-profile-edit-file" name="file"
                                               required="required">
                                        <label class="custom-file-label" for="dm-profile-edit-file">Pilih file</label>
                                    </div>

                                    @error('file')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <button class="btn btn-primary btn-block" type="submit">
                                            <i class="fa fa-fw fa-paper-plane"></i>
                                            Upload
                                        </button>
                                    </div>
                                    <div class="col-sm-6">
                                        <x-back-button link="lecturers.index" type="btn-secondary btn-block"></x-back-button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="block block-rounded">
                    <div class="block-header block-header-default">
                        <i class="fa fa-fw fa-info-circle text-muted mr-1"></i>
                        <h3 class="block-title">Panduan</h3>
                    </div>
                    <div class="block-content">

                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- END Page Content -->
@endsection