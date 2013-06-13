class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @event_time = EventTime.new
    @location = Location.new
    @user = User.new  ####is this right?
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
  @event_time = EventTime.new
     @location = Location.new
     
     @location_votes = @event.votes.count(group: :location_id)
     @sorted_location_votes = []
     @location_votes.each do |id, count|
       @sorted_location_votes << {id: id, count: count}
     end
     @sorted_location_votes.sort! { |x, y| y[:count] <=> x[:count] }
     @location_votes = @sorted_location_votes
     
     
     @event_time_votes = @event.votes.count(group: :event_time_id)
     @sorted_event_time_votes = []
     @event_time_votes.each do |id, count|
       @sorted_event_time_votes << {id: id, count: count }
     end
     @event_time_votes = @sorted_event_time_votes.sort { |x, y| y[:count] <=> x[:count]}

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
  @event_time = EventTime.new
  @location = Location.new
  # @location_id = LocationId.new
      respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  @event_time = EventTime.new
   @location = Location.new
    end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

      respond_to do |format|
      if @event.save
      #
      #     # totalvotes =5
      #     #
      #     #         totalvotes.each do
      #      Vote.create(:event_id => @event.id)


        format.html { redirect_to new_event_time_path(event_id: @event.id), notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end


  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    @event_time = EventTime.new
    @location = Location.new
      respond_to do |format|
      if @event.update_attributes(params[:event])
        # redirect_to event_time_url
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end

