class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def created
    project = Project.new
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :completed)
  end

end
