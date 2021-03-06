class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new
    @event_id = params[:event_id]
    @location.event_id = @event_id
    @event_time = EventTime.new
  

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    # raise params.inspect
    params[:location].each do |locale|
      location = Location.new
      location.event_id = locale[:event_id]
      location.name = locale[:name]
      location.save
    end

    redirect_to new_vote_path(event_id: params[:event_id]), notice: 'Event was successfully created.'
    # @location = Location.new(params[:location])
    # @event = @location.event
   
    # respond_to do |format|
      # if @location.save
        # format.html { redirect_to @location, notice: 'Location was successfully created.' }
        # format.html { redirect_to new_vote_path(event_id: @event.id), notice: 'Event was successfully created.' }
        # format.json { render json: @location, status: :created, location: @location }
      # else
        # format.html { render action: "new" }
        # format.json { render json: @location.errors, status: :unprocessable_entity }
      # end
    # end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end
end
