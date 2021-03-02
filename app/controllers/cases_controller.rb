class CasesController < ApplicationController
  def index
    @cases = Case.all
  end

  def show
    @case = Case.find(params[:id])
  end

  def new
    @case = Case.new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
