require 'net/http'
require 'faraday'

class CompetitorsController < ApplicationController
  before_action :set_competitor, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token


  # GET /competitors
  # GET /competitors.json
  def index
    @competitors = Competitor.all
  end

  # GET /competitors/1
  # GET /competitors/1.json
  def show
    render json: @competitor_price
  end

  # GET /competitors/new
  def new
    @competitor = Competitor.new
  end

  # GET /competitors/1/edit
  def edit
  end

  # POST /competitors
  # POST /competitors.json
  def create
    #dev
    #client = Elasticsearch::Client.new host: "http://192.168.100.6:9200"
    #url = URI.parse(URI.escape("http://192.168.100.6:30003/predict?title=#{product_name}"))
    #

    client = Elasticsearch::Client.new host: "http://#{ENV['ES_HOST']}:9200"
    product_name = competitor_params[:title]
    query =  { "_source": ["title", "price","store_id","product_id","store_name","imageurl","size","url","updated_at","status","currency"], "query":{ "match":{ "title":{"query":product_name} } } }
    es_response =client.search index: 'honestbee', body: query
    #Array
    @data = es_response['hits']['hits'].map { |r| r['_source']}

    #GetProductCatalog
    url = URI.parse(URI.escape("http://#{ENV['FLASK_HOST']}:30003/predict?title=#{product_name}"))
    res = Faraday.get url
    res_catalog = res.body

    @competitor = Competitor.new(competitor_params.merge(:catalog => res_catalog))
    if @competitor.save
      render :json => @data
    else
    end
    
    #respond_to do |format|
    #  if @competitor.save
    #    format.html { redirect_to @competitor, notice: 'Competitor was successfully created.' }
    #    format.json { render :show, status: :created, location: @competitor }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @competitor.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /competitors/1
  # PATCH/PUT /competitors/1.json
  def update
    respond_to do |format|
      if @competitor.update(competitor_params)
        format.html { redirect_to @competitor, notice: 'Competitor was successfully updated.' }
        format.json { render :show, status: :ok, location: @competitor }
      else
        format.html { render :edit }
        format.json { render json: @competitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competitors/1
  # DELETE /competitors/1.json
  def destroy
    @competitor.destroy
    respond_to do |format|
      format.html { redirect_to competitors_url, notice: 'Competitor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competitor
      @competitor = Competitor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competitor_params
      params.require(:competitor).permit(:imageurl, :latitude, :longitude, :price, :source, :title, :update_at, :url, :user_id)
    end
end
