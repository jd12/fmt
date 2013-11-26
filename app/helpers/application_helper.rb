module ApplicationHelper

  def logout_session_control
    if (user = user_signed_in?) || administrator_signed_in?
      'Welcome ' + (user ? current_user.name : current_administrator.name) + '! <span> ' + (link_to "Sign Out", destroy_user_session_path, method: :delete) + '</span>'
    else
      ''
    end
  end

  def page_header(h1_text, small_text = '')
    content_tag(:div, page_h1(h1_text, small_text), class: 'page-header')
  end

  def page_h1(h1_text, small_text)
    content_tag :h1 do
      concat(h1_text)
      concat(header_small(small_text))
    end
  end

  def header_small(small_text)
    content_tag :small do
      concat(tag(:br) + small_text)
    end
  end

  def generate_sidebar
    if administrator_signed_in?
      admin_sidebar
    elsif user_signed_in? && (@project.present? || params[:project_id])
      project = @project || Project.find(params[:project_id])
      role = project.role_for_user(current_user)

      if role == 'Project Manager'
        projman_sidebar(project)
      end
    end
  end

  def admin_sidebar
    html = '<li class="nav-header">Projects</li>'
    html << (content_tag :li, (link_to 'Project Management', project_managements_path))
    html << '<li class="nav-header">Users</li>'
    html << (content_tag :li, (link_to 'User Management', user_managements_path))
    html << (content_tag :li, (link_to 'Create User', new_user_registration_path))
    html.html_safe
  end

  def projman_sidebar(project)
    html = '<li class="nav-header">Projects</li>'
    html << (content_tag :li, (link_to 'Project List', projects_path))
    html << (content_tag :li, (link_to 'Project Management', project_managements_path(project_id: project.id)))
    html << '<li class="nav-header">Requirements</li>'
    html << (content_tag :li, (link_to 'Manage Requirements', requirements_documents_path(project_id: project.id)))
  end

  def flash_class(level)
    case level
      when :notice then 'alert-info'
      when :error then 'alert-error'
      when :alert then ''
    end
  end

  def errors_for(object, message=nil)
    html = ""
    unless object.errors.blank?
      html << "<div class='formErrors #{object.class.name.humanize.downcase}Errors'>\n"
      if message.blank?
        if object.new_record?
          html << "\t\t<h5>There was a problem creating the #{spaced(object.class.name)}</h5>\n"
        else
          html << "\t\t<h5>There was a problem updating the #{spaced(object.class.name)}</h5>\n"
        end
      else
        html << "<h5>#{message}</h5>"
      end
      html << "\t\t<ul>\n"
      object.errors.full_messages.each do |error|
        html << "\t\t\t<li>#{error}</li>\n"
      end
      html << "\t\t</ul>\n"
      html << "\t</div>\n"
    end
    html.html_safe
  end

  def spaced(camel_cased_word)
    camel_cased_word.to_s.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1 \2').
      gsub(/([a-z\d])([A-Z])/,'\1 \2').
      tr("-", " ").
      downcase
  end

  def management_actions(objekt, requirements_document=nil)
    content_tag :div, class: 'btn-group' do
      concat(management_action_button)
      concat(management_action_dropdown(objekt, requirements_document))
    end
  end

  def management_action_button
    content_tag :button, class: 'btn btn-primary dropdown-toggle', data: {toggle: 'dropdown'} do
      (content_tag :span, 'Actions ') + (tag :span, class: 'caret')
    end
  end

  def management_action_dropdown(objekt, requirements_document)
    content_tag :ul, class: 'dropdown-menu' do
      if objekt.class == Project
        concat(content_tag :li, (link_to 'Edit Project', edit_project_path(objekt)))

        if can? :destroy, Project
          concat(content_tag :li, (link_to 'Delete Project', project_path(objekt), method: :delete, confirm: 'Are you sure you want to delete this project?'))
        end
      elsif objekt.class == UseCase
        concat(content_tag :li, (link_to 'Edit Use Case', edit_requirements_document_use_case_path(requirements_document, objekt, project_id: requirements_document.project.id)))
        concat(content_tag :li, (link_to 'Delete Use Case', requirements_document_use_case_path(requirements_document, objekt, project_id: requirements_document.project.id), method: :delete, confirm: 'Are you sure you want to delete this use case?'))
      end
    end
  end

end