require 'elasticsearch'

class CompetitorPricesController < ApplicationController
  before_action :set_competitor_price, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /competitor_prices
  # GET /competitor_prices.json
  def index
    @competitor_prices = CompetitorPrice.all
  end

  # GET /competitor_prices/1
  # GET /competitor_prices/1.json
  def show
    render json: @competitor_price
  end

  # GET /competitor_prices/new
  def new
    @competitor_price = CompetitorPrice.new
  end

  # GET /competitor_prices/1/edit
  def edit
  end

  # POST /competitor_prices
  # POST /competitor_prices.json
  def create

    client = Elasticsearch::Client.new host: 'http://192.168.2.125:9200'
    client.search index: 'honestbee', body: {"query":{"match":{"title":{"query":"牛排"}}}} -H 'Content-Type: application/json'
 


    respond_to do |format|
      if @competitor_price.save
        format.html { redirect_to @competitor_price, notice: 'Competitor price was successfully created.' }
        format.json { render :show, status: :created, location: @competitor_price }
      else
        format.html { render :new }
        format.json { render json: @competitor_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competitor_prices/1
  # PATCH/PUT /competitor_prices/1.json
  def update
    respond_to do |format|
      if @competitor_price.update(competitor_price_params)
        format.html { redirect_to @competitor_price, notice: 'Competitor price was successfully updated.' }
        format.json { render :show, status: :ok, location: @competitor_price }
      else
        format.html { render :edit }
        format.json { render json: @competitor_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competitor_prices/1
  # DELETE /competitor_prices/1.json
  def destroy
    @competitor_price.destroy
    respond_to do |format|
      format.html { redirect_to competitor_prices_url, notice: 'Competitor price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competitor_price
      @competitor_price = CompetitorPrice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competitor_price_params
      params.require(:competitor_price).permit(:imageurl, :price, :source, :title, :update_at, :url)
    end
end

require 'multi_json'
require 'faraday'
require 'elasticsearch/api'


