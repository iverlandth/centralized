class SubEventsController < ApplicationController
  before_action :set_sub_event, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  before_action :authenticate_user!
  before_filter :load_church
  # GET /sub_events
  # GET /sub_events.json
  def index
    @sub_events = SubEvent.all
  end

  # GET /sub_events/1
  # GET /sub_events/1.json
  def show
  end

  # GET /sub_events/new
  def new
    @sub_event = SubEvent.new
  end

  # GET /sub_events/1/edit
  def edit
  end

  # POST /sub_events
  # POST /sub_events.json
  def create
    @sub_event = SubEvent.new(sub_event_params)

    respond_to do |format|
      if @sub_event.save
        format.html { redirect_to @sub_event, notice: 'Sub event was successfully created.' }
        format.json { render :show, status: :created, location: @sub_event }
      else
        format.html { render :new }
        format.json { render json: @sub_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_events/1
  # PATCH/PUT /sub_events/1.json
  def update
    respond_to do |format|
      if @sub_event.update(sub_event_params)
        format.html { redirect_to @sub_event, notice: 'Sub event was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_event }
      else
        format.html { render :edit }
        format.json { render json: @sub_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_events/1
  # DELETE /sub_events/1.json
  def destroy
    @sub_event.destroy
    respond_to do |format|
      format.html { redirect_to sub_events_url, notice: 'Sub event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_event
      @sub_event = SubEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_event_params
      params.require(:sub_event).permit(:name, :description, :sub_event_start_at, :sub_event_end_at, :place, :event_id)
    end
end
