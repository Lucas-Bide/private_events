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
    @event.date_valid?
    if @event.save
      year = @event.date[6...9]
      month = @event.date[0...2]
      day = @event.date[3...5]
      @event.date = year + '-' + month + '-' + day
      @event.save
      redirect_to @event
    else
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
