class UsersController < ApplicationController
  include UsersHelper
  before_action :already_signed_in?, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    p "DROP IDDDDDDDDDDDDDDD: #{params[:drop_id]}"
    if params[:join_id]
      @user.attended_events << Event.find(params[:join_id])
    else
      @user.attended_events.delete(params[:drop_id])
    end
    redirect_to @user
  end

  private
  
  def already_signed_in?
    redirect_to User.find(session[:current_user]) if session[:current_user]
  end
end
