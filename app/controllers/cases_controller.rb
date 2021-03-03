class CasesController < ApplicationController
  def index
    @cases = Case.all
  end

  def new
    @case = Case.new
    # same as:
    # @case.build_patient
    @case.patient = Patient.new
  end

  def show
    @case = Case.find(params[:id])
  end

  def create
    @case = Case.new(case_params)
    @case.patient = Patient.find(params[:case][:patient_id]) if params[:case][:patient_id]
    @case.user = current_user
    @case.save

    redirect_to case_path(@case)
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private

  def case_params
    params.require(:case).permit(:description,
                                 patient_attributes: [:first_name, :last_name, :gender,
                                                      :date_of_birth, :address])
  end
end
