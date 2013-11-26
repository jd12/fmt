module ProjectsHelper

  def project_subtitle
    if administrator_signed_in?
      'Choose a project to modify or create a new one'
    elsif user_signed_in?
      'Choose a project to begin'
    else
      ''
    end
  end

end