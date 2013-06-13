class EventTimesController < ApplicationController
  # GET /event_times
  # GET /event_times.json
  def index
    @event_times = EventTime.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_times }
    end
  end

  # GET /event_times/1
  # GET /event_times/1.json
  def show
    @event_time = EventTime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_time }
    end
  end

  # GET /event_times/new
  # GET /event_times/new.json
  def new
    @event_time = EventTime.new
    @event_id = params[:event_id]
    @event_time.event_id = @event_id
    @location = Location.new



    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_time }
    end
  end

  # GET /event_times/1/edit
  def edit
    @event_time = EventTime.find(params[:id])
  end

  # POST /event_times
  # POST /event_times.json
  def create
      # raise params.inspect
      params[:event_time].each do |clock|
        event_time = EventTime.new
        event_time.event_id = clock[:event_id]
        time_string = "#{clock[:time_description][:hour]}:#{clock[:time_description][:minute]} #{clock[:time_description][:ampm]}"
        event_time.time_description = Time.parse(time_string)  
        event_time.save
      end
           # @event_time = EventTime.new(params[event])
           # @location = @event_time.event
    redirect_to new_location_path(event_id: params[:event_id]), notice: 'Give a Location or provide up to 4 options'
    # respond_to do |format|
      # if @event_time.save
        # format.html { redirect_to @event_time, notice: 'Event time was successfully created.' }
        # format.html { redirect_to new_location_path(event_id: @event.id), notice: 'Event was successfully created.' }
      # format.html { redirect_to new_event_time_path(event_id: @event.id), notice: 'Event was successfully created.' }
        # format.json { render json: @event, status: :created, location: @event }
        # format.json { render json: @event_time, status: :created, location: @event_time }
      # else
        # format.html { render action: "new" }
        # format.json { render json: @event_time.errors, status: :unprocessable_entity }
      # end
    end


  # PUT /event_times/1
  # PUT /event_times/1.json
  def update
    @event_time = EventTime.find(params[:id])

    respond_to do |format|
      if @event_time.update_attributes(params[:event_time])
        format.html { redirect_to @event_time, notice: 'Event time was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_times/1
  # DELETE /event_times/1.json
  def destroy
    @event_time = EventTime.find(params[:id])
    @event_time.destroy

    respond_to do |format|
      format.html { redirect_to event_times_url }
      format.json { head :no_content }
    end
  end
end
 # end
