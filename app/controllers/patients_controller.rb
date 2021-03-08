class PatientsController < ApplicationController
  # create patient on case/new page
  def show
    @patient = Patient.find(params[:id])
  end

  def create
    @patient = Patient.new(patient_params)
    @case = Case.find(params[:case_id])
      raise

    if @patient.save
      # case/show page, when patient created successfully
      redirect_to case_path(@case)
    else
      # case/new page, when patient not created properly
      render "cases/new"
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :gender,
                                    :date_of_birth, :address, photos: [], documents: [], medications: [])
  end
end
