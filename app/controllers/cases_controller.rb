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
    raise
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
