class ProjectManagementsController < ApplicationController

  authorize_resource

  def index
    if administrator_signed_in?
      @projects = Project.all
    else
      @projects = [Project.find(params[:project_id])]
    end
  end

  def remove_user_from_project
    @project = Project.find(params[:project_management_id])
    @project.roles.where('roles.user_id' => params[:user_id]).first.destroy

    redirect_to edit_project_path(@project)
  end

end