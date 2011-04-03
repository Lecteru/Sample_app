class EventsController < ApplicationController
  def index
    @title = "All events"
    @events = Event.paginate(:page => params[:page])
  end

  def new
    @events = Event.new
  end


  def create
    @events = Event.new(params[:event])
    if @events.save
       redirect_to events_path
    else
      render :action => 'new'
    end

  end
end
