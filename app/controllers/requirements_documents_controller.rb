class RequirementsDocumentsController < ApplicationController

  authorize_resource

  def index
    @project = Project.find(params[:project_id])
    @requirements_document = @project.requirements_document
  end
end