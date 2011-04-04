class EventsController < ApplicationController
  def index
    @title = "All events"
    @events = Event.paginate(:page => params[:page])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(params[:event])
    if @event.save
       flash[:success] = "Yea!"
       redirect_to events_path
    else
      flash[:success] = "No!"
      render :action => 'new'
    end

  end

  def show
    @event = Event.find(params[:id])
    @title = @event.name
  end

  def destroy
    @event.destroy
    flash[:success] = "Event destroyed."
    redirect_to events_path
  end
end
