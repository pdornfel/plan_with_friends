class EventsController < ApplicationController

  def new
    @event = Event.new
    @group = Group.find(params[:group_id])
  end

  def create
    @event = Event.new(event_params)
    group = Group.find(params[:group_id])
    @event.group = Group.find(params[:group_id])
    if @event.save
      flash[:notice] = "Event Created Successfully"
      redirect_to group_path(group)
    else
      flash[:notice] = "Unable to save Event"
      redirect_to group_path(group)
    end
  end

  def show
    @event = Event.find(params[:id])
    @group = @event.group
    @proposed_location = ProposedLocation.new
    @proposed_locations = @event.proposed_locations
  end

  private

  def event_params
    params.require(:event).permit(:name, :faketime, :fakedate)
  end

end