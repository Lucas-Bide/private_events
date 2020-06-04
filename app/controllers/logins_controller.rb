class LoginsController < ApplicationController
  include UsersHelper
  before_action :not_signed_in?, only: [:new, :create]
  
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      session[:current_user] = @user.id
      redirect_to @user
    else
      @message = "That username doesn't exist"
      render 'logins/new'
    end
  end

  private

  def not_signed_in?
    if session[:current_user]
      redirect_to User.find(session[:current_user])
    end
  end

end
