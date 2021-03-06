class ChurchesController < ApplicationController
  before_action :set_church, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  #before_action :authenticate_user!
  #before_filter :load_church
  # GET /churches
  # GET /churches.json
  def index
    @churches = Church.all
  end

  # GET /churches/1
  # GET /churches/1.json
  def show
    @exist_coordinates = exist_coordinates?
  end

  # GET /churches/new
  def new
    @exist_coordinates = exist_coordinates?
    @church = Church.new
  end

  # GET /churches/1/edit
  def edit
    @exist_coordinates = exist_coordinates?
  end

  # POST /churches
  # POST /churches.json
  def create
    @church = Church.new(church_params)
    @exist_coordinates = exist_coordinates?


    respond_to do |format|
      if @church.save
        unless current_user.church_id.present?
          update_user = User.find(current_user.id)
          update_user.church = @church
          update_user.save!
        end
        format.html { redirect_to @church, notice: I18n.t('church_created') }
        format.json { render :show, status: :created, location: @church }
      else
        format.html { render :new }
        format.json { render json: @church.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /churches/1
  # PATCH/PUT /churches/1.json
  def update
    @exist_coordinates = exist_coordinates?
    respond_to do |format|
      if @church.update(church_params)
        format.html { redirect_to @church, notice: I18n.t('church_updated') }
        format.json { render :show, status: :ok, location: @church }
      else
        format.html { render :edit }
        format.json { render json: @church.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /churches/1
  # DELETE /churches/1.json
  def destroy
    @church.destroy
    respond_to do |format|
      format.html { redirect_to churches_url, notice: I18n.t('church_destroyed') }
      format.json { head :no_content }
    end
  end

  def exist_coordinates?
    @church.latitude.present? && @church.longitude.present?
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_church
    @church = Church.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def church_params
    params.require(:church).permit(:name, :address, :mission, :vision, :country, :state, :latitude, :longitude,
                                   :twitter_url, :facebook_url, :image_prev_url, :logo)
  end
end
