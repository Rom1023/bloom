class LinksController < ApplicationController
  def create
    @link = Link.new
    @link.project = Project.find(params[:project_id])
    @link.case = Case.find(params[:link][:case_id])
    if @link.save
      redirect_to project_path(@link.project, anchor: :cases)
    else
      render 'projects/show'
    end
  end
end
