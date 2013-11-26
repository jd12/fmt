class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization unless: :devise_controller?

  def current_ability
    @current_ability ||= set_ability
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected

  def set_ability
    user = (administrator_signed_in? ? current_administrator : current_user)
    project = (params[:id] if params[:controller] == 'projects') || params[:project_id] || (RequirementsDocument.find(params[:requirements_document_id]).project.id if params[:requirements_document_id])
    Ability.new(user, project)
  end
end