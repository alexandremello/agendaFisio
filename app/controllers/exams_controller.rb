class ExamsController < ApplicationController
  # GET /exams
  # GET /exams.json
  def index
    @exams = Exam.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exams }
    end
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
    @patient = Patient.find(params[:patient_id])
    @exam = Exam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam }
    end
  end

  # GET /exams/new
  # GET /exams/new.json
  def new
    @patient = Patient.find(params[:patient_id])
    @exam = Exam.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam }
    end
  end

  # GET /exams/1/edit
  def edit
    @patient = Patient.find(params[:patient_id])
    @exam = Exam.find(params[:id])
  end

  # POST /exams
  # POST /exams.json
  def create
    @patient = Patient.find(params[:patient_id])
    @exam = @patient.exams.new(params[:exam])

    respond_to do |format|
      if @exam.save
        format.html { redirect_to patient_exam_path(@patient, @exam), notice: 'Exam was successfully created.' }
        format.json { render json: @exam, status: :created, location: @exam }
      else
        format.html { render action: "new" }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exams/1
  # PUT /exams/1.json
  def update
    @exam = Exam.find(params[:id])
    #@patient = @exam.patient

    respond_to do |format|
      if @exam.update_attributes(params[:exam])
        format.html { redirect_to patient_exam_path(@exam.patient, @exam), notice: 'Exam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy

    respond_to do |format|
      format.html { redirect_to exams_url }
      format.json { head :no_content }
    end
  end
end
