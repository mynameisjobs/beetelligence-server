require 'net/http'
require 'faraday'
require 'elasticsearch'

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
    product_name = competitor_params[:title]
    honestbee_datas = get_honestbee_data (product_name)
    predict_catalog = get_predict_catalog ( product_name )
    save_data_in_postgres (predict_catalog)
    render :json => honestbee_datas
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


    def get_honestbee_data ( product_name )
      begin
        retries ||= 0
        #client = Elasticsearch::Client.new host: "http://192.168.100.2:9200"
        client = Elasticsearch::Client.new host: "http://#{ENV['ES_HOST']}:9200"
        query =  { "_source": ["title", "price","store_id","product_id","store_name","imageurl","size","url","updated_at","status","currency"], "query":{"bool":{"filter":[{"term":{"status":"status_available"}}],"must":[{"match":{"title":product_name}}]}} }
        es_response =client.search index: 'honestbee', body: query
        data_list = es_response['hits']['hits'].map { |r| r['_source']}
        return data_list
      rescue Timeout::Error
        retry if (retries += 1) < 3
      end
    end

    def get_predict_catalog ( product_name )
      begin
        #predict_url = URI.parse(URI.escape("http://192.168.100.2:30003/predict?title=#{product_name}"))
        predict_url = URI.parse(URI.escape("http://#{ENV['FLASK_HOST']}:#{ENV['FLASK_PORT']}/predict?title=#{product_name}"))      
        predict_res = Faraday.get predict_url
        predict_catalog = predict_res.body
        return predict_catalog
      rescue Timeout::Error
        retry if (retries += 1) < 3
      end
    end

    def save_data_in_postgres ( predict_catalog )
      @competitor = Competitor.new(competitor_params.merge(:catalog => predict_catalog))
      if @competitor.save
          return "save success."
      else
          #send email
          return "save failed"
      end
    end


end
