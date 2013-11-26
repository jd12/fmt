class UseCasesController < ApplicationController

  authorize_resource

  before_filter :load_requirements_document, only: [:new, :create, :edit, :update, :destroy]

  def new
    @use_case = @requirements_document.use_cases.build
  end

  def create
    @use_case = @requirements_document.use_cases.build(params[:use_case])
    if @use_case.save
      redirect_to requirements_documents_path(project_id: @requirements_document.project.id), notice: 'Use Case was successfully created.'
    else
      params[:project_id] = @requirements_document.project.id
      render action: "new"
      flash[:error] = 'Use case could not be created'
    end
  end

  def edit
    @use_case = UseCase.find(params[:id])
  end

  def update
    @use_case = UseCase.find(params[:id])

    if @use_case.update_attributes(params[:use_case])
      redirect_to requirements_documents_path(project_id: @requirements_document.project.id), notice: 'Use case was successfully updated.'
    else
      params[:project_id] = @use_case.requirements_document.project.id
      render action: "edit"
      flash[:error] = 'Use Case could not be updated'
    end
  end

  def destroy
    @use_case = @requirements_document.use_cases.find(params[:id])
    @use_case.destroy

    redirect_to requirements_documents_path(project_id: @requirements_document.project.id), notice: 'Use case was successfully deleted'
  end

  private

  def load_requirements_document
    @requirements_document = RequirementsDocument.find(params[:requirements_document_id])
  end

end