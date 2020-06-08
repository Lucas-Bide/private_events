class EventsController < ApplicationController
  include EventsHelper
  before_action :signed_in?, only: [:new, :create]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = User.find(session[:current_user]).creations.build(event_params)
        if @event.save
      redirect_to @event
    else
      p @event.date
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def signed_in?
    redirect_to 'logins/new' unless session[:current_user]
  end

end
