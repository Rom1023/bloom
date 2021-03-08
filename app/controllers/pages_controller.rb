class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def search
    if params[:query] == ""
      render :home, notice: 'Please enter search keyword'
    else
      if params[:search_option] == 'projects'
        @projects = Project.all.search_by_name_and_description(params[:query])
        render 'projects/index'
      elsif params[:search_option] == 'cases'
        @cases = Case.all.search_by_name_and_description(params[:query])
        render 'cases/index'
      else
        @projects = Project.all.search_by_name_and_description(params[:query])
        @cases = Case.all.search_by_name_and_description(params[:query])
      end
    end
  end
end
