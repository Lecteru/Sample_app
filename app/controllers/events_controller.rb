class EventsController < ApplicationController
  def index
    @title = "All events"
    @events = Event.search(params[:search])
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
    Event.find(params[:id]).destroy
    flash[:success] = "Event destroyed."
    redirect_to events_path
  end

  def edit
    @title = "Edit event"
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:success] = "Event updated."
      redirect_to @event
    else
      @title = "Edit event"
      render 'edit'
    end
  end

end
