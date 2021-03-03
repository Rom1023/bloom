class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @link = Link.new
    @links = Link.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.collaborations << Collaboration.new(user: current_user, role: 'admin')
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :completed)
  end

end
