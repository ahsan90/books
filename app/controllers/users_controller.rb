class UsersController < ApplicationController
  def index
    @users = User.all
    authorize! :index, User
  end

  def show
    @user = User.find(params[:id])
    authorize! :show, @user, message: "You need to be an admin to view this page."
  end

end
