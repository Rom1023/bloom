class CasesController < ApplicationController
  def index
    if params[:query].present?
      @cases = Case.all.search_by_name_and_description(params[:query])
    else
      @cases = Case.all
    end
  end

  def new
    @case = Case.new
    # same as:
    # @case.build_patient
    @case.patient = Patient.new
    @names = current_user.patients.map { |patient| [patient.patient_full_name, patient.id] }.uniq
  end

  def show
    @case = Case.find(params[:id])
    @links = Link.all
  end

  def create
    @case = Case.new(case_params)
    @case.patient = Patient.find(params[:case][:patient_id]) unless params[:case][:patient_id] == ""
    @case.user = current_user

    if @case.save
      redirect_to case_path(@case)
    else
      render "new"
    end
  end

  def edit
    @case = Case.find(params[:id])
    @names = current_user.patients.map { |patient| [patient.patient_full_name, patient.id] }.uniq

  end

  def update
    @case = Case.find(params[:id])

    if @case.update(case_params)
      redirect_to case_path(@case)
    else
      raise
      @names = current_user.patients.map { |patient| [patient.patient_full_name, patient.id] }.uniq
      render :edit
    end
  end

  def destroy
    @case = Case.find(params[:id])
    @case.destroy

    redirect_to cases_path
  end

  private

  def case_params
    # Nested Attributes: create patient and case at the same time
    params.require(:case).permit(:description, :title, :patient_id,
                                 patient_attributes: [:id, :first_name, :last_name, :gender,
                                                      :date_of_birth, :address, photos: [], documents: [], medications: [],
                                                      treatments: [], surgeries: [], lab_tests: [], genetic_results: [],
                                                      allergies: []])
  end
end
