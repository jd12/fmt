class ProjectsController < ApplicationController

  authorize_resource
  skip_authorize_resource only: :index
  skip_authorization_check only: [:index]

  def index
    if user_signed_in = user_signed_in?
      @projects = current_user.projects
    elsif administrator_signed_in?
      redirect_to root_path, alert: 'Administrators can not have projects assigned to them'
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    @project.requirements_document = RequirementsDocument.new(:project_id => @project.id)
    if @project.save
      redirect_to project_managements_path, notice: 'Project was successfully created.'
    else
      render action: "new"
      flash[:error] = 'Project could not be created'
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to project_managements_path(:project_id => @project.id), notice: 'Project was successfully updated.'
    else
      render action: "edit"
      flash[:error] = 'Project could not be updated'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to project_managements_path, notice: 'Project was successfully deleted'
  end

end