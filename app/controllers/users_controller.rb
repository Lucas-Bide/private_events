class UsersController < ApplicationController
  include UsersHelper
  before_action :already_signed_in?, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  
  def already_signed_in?
    redirect_to User.find(session[:current_user]) if session[:current_user]
  end
end
