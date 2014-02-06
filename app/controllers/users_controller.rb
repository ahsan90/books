class UsersController < ApplicationController
  def index
    authorize! :index, Users
#    @users = User.accessible_by(current_ability)
  end

  def show
    @user = User.find(params[:id])
    authorize! :show, @user, message: "You need to be an admin to view this page."
  end

end
