class VotesController < ApplicationController
  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @votes }
    end
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
    @vote = Vote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vote }
    end
  end
  # if @user.email.save

  # GET /votes/new
  # GET /votes/new.json
  def new


    # cookies.delete :events_voted
    puts cookies[:events_voted].class
    puts cookies[:events_voted].inspect

    if cookies[:events_voted].present?
      events_voted = cookies[:events_voted].split('&')
    else
      events_voted = []
    end
    puts events_voted.inspect


    @vote = Vote.new
    @location = Location.all
    @event = Event.find(params[:event_id])
    @event_time = EventTime.new
    @vote.event_id = params[:event_id]
    @v = EventTime.all
    @eventhere = Event.find_by_id(params[:event_id])

    respond_to do |format|
      if events_voted.include?(params[:event_id])
        # puts "Already voted for event #{params[:event_id]}"
        format.html { redirect_to @event, notice: 'You cannot vote more than once.' }
        format.json { render json: @event, status: :created, location: @vote }
      else
        format.html # new.html.erb
        format.json { render json: @vote }
      end
    end
  end

  # GET /votes/1/edit
  def edit
    @vote = Vote.find(params[:id])

  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(params[:vote])
    # @event_times = EventTime.new #where does this go and why?
    @event = Event.find(@vote.event_id)
    @eventhere = Event.find_by_id(@vote.event_id)

    if cookies[:events_voted].present?
      cookies.permanent[:events_voted] = cookies[:events_voted].split('&').map { |event_id| event_id.to_i }
    else
      cookies.permanent[:events_voted] = []
    end
    puts cookies[:events_voted].inspect

    respond_to do |format|
      if cookies[:events_voted].include?(@vote.event_id)
        format.html { redirect_to @event, notice: 'You cannot vote more than once.' }
        format.json { render json: @event, status: :created, location: @vote }
      elsif @vote.save
        cookies[:events_voted] << @vote.event_id
        puts cookies[:events_voted].inspect

        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render json: @vote, status: :created, location: @vote }
      else

        format.html { render action: "new" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /votes/1
  # PUT /votes/1.json
  def update
    @vote = Vote.find(params[:id])


    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to votes_url }
      format.json { head :no_content }
    end
  end
end
