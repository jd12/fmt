class UserManagementsController < ApplicationController

  authorize_resource

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to user_managements_path, notice: 'User was successfully deleted'
  end
end