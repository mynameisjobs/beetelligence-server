require 'faraday'
class NexttimeslotsController < ApplicationController
  before_action :set_nexttimeslot, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /nexttimeslots
  # GET /nexttimeslots.json
  def index
    @nexttimeslots = Nexttimeslot.all
  end

  # GET /nexttimeslots/1
  # GET /nexttimeslots/1.json
  def show
  end

  # GET /nexttimeslots/new
  def new
    @nexttimeslot = Nexttimeslot.new
  end

  # GET /nexttimeslots/1/edit
  def edit
  end

  # POST /nexttimeslots
  # POST /nexttimeslots.json
  def create
    #@nexttimeslot = Nexttimeslot.new(nexttimeslot_params)
    resp = Faraday.get "https://www.honestbee.tw/api/api/next_available_timeslot?storeId=#{nexttimeslot_params['store_id']}\
    &latitude=#{nexttimeslot_params['latitude']}&longitude=#{nexttimeslot_params['longitude']}"
    render :json => JSON.parse(resp.body)['timeslot']
  end

  # PATCH/PUT /nexttimeslots/1
  # PATCH/PUT /nexttimeslots/1.json
  def update
    respond_to do |format|
      if @nexttimeslot.update(nexttimeslot_params)
        format.html { redirect_to @nexttimeslot, notice: 'Nexttimeslot was successfully updated.' }
        format.json { render :show, status: :ok, location: @nexttimeslot }
      else
        format.html { render :edit }
        format.json { render json: @nexttimeslot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nexttimeslots/1
  # DELETE /nexttimeslots/1.json
  def destroy
    @nexttimeslot.destroy
    respond_to do |format|
      format.html { redirect_to nexttimeslots_url, notice: 'Nexttimeslot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nexttimeslot
      @nexttimeslot = Nexttimeslot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nexttimeslot_params
      params.require(:nexttimeslot).permit(:store_id, :latitude, :longitude)
    end
end
