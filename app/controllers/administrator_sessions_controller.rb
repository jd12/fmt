class AdministratorSessionsController < Devise::SessionsController

  before_filter :logout_user, :only => "create"

  def create
    super
  end

  private

  def logout_user
    sign_out :user
  end

end