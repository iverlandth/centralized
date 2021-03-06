class PetitionsController < ApplicationController
  before_action :set_petition, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :load_church
  # GET /petitions
  # GET /petitions.json
  def index
    @petitions = Petition.my_petitions(@church.id)
  end

  # GET /petitions/1
  # GET /petitions/1.json
  def show
  end

  # GET /petitions/new
  def new
    @petition = Petition.new
  end

  # GET /petitions/1/edit
  def edit
  end

  # POST /petitions
  # POST /petitions.json
  def create
    @petition = Petition.new(petition_params)
    @petition.church = @church
    @petition.user = current_user

    respond_to do |format|
      if @petition.save
        @petition.new!
        format.html { redirect_to @petition, notice: I18n.t('petition_created') }
        format.json { render :show, status: :created, location: @petition }
      else
        format.html { render :new }
        format.json { render json: @petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /petitions/1
  # PATCH/PUT /petitions/1.json
  def update
    respond_to do |format|
      if @petition.update(petition_params)
        format.html { redirect_to @petition, notice: I18n.t('petition_updated') }
        format.json { render :show, status: :ok, location: @petition }
      else
        format.html { render :edit }
        format.json { render json: @petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /petitions/1
  # DELETE /petitions/1.json
  def destroy
    @petition.destroy
    respond_to do |format|
      format.html { redirect_to petitions_url, notice: I18n.t('petition_destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_petition
      @petition = Petition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def petition_params
      params.require(:petition).permit(:category, :title, :message, :status, :church_id, :user_id)
    end
end
