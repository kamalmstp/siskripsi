<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateLecturerCompetenciesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //Drop table first
        Schema::dropIfExists('lecturer_competencies');

        //Create new table
        Schema::create('lecturer_competency', function (Blueprint $table) {
            $table->uuid('lecturer_id');
            $table->uuid('science_field_id');

            $table->foreign('lecturer_id')->references('id')
                ->on('lecturers');

            $table->foreign('science_field_id')->references('id')
                ->on('science_fields');
        });


    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //Drop new table
        Schema::dropIfExists('lecturer_competency');

        //Create old table
        Schema::create('lecturer_competencies', function (Blueprint $table) {
            $table->uuid('id');
            $table->string('nidn');
            $table->uuid('science_field_id');

            $table->primary('id');

            $table->foreign('nidn')->references('nidn')
                ->on('lecturers');

            $table->foreign('science_field_id')->references('id')
                ->on('science_fields');
        });
    }
}