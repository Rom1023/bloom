class CollaborationsController < ApplicationController
  def create
    @project = Project.find(params[:id])
    @collaboration = Collaboration.new(params_collaboration)
    @collaboration.project = @project
    @collaboration.user = current_user

    if @collaboration.save
      redirect_to project_path(@project)
    # else
    #   render :create
    end
  end

  private

  def params_collaboration
    params.require(:collaboration).permit(:role)
  end
end
