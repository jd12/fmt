class UserSessionsController < Devise::SessionsController

  before_filter :logout_administrator, :only => "create"

  def create
    super
  end

  private

  def logout_administrator
    sign_out :administrator
  end

end