class CollaborationsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @collaboration = Collaboration.new(role: 'collaborator')
    @collaboration.project = @project
    @collaboration.user = current_user

    if @collaboration.save
      redirect_to project_path(@project)
    else
      render project_path(@project), alert: 'Could not create collaboration'
    end
  end
end
