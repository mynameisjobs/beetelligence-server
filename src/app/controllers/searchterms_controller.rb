class SearchtermsController < ApplicationController
  before_action :set_searchterm, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /searchterms
  # GET /searchterms.json
  def index
    @searchterms = Searchterm.all
  end

  # GET /searchterms/1
  # GET /searchterms/1.json
  def show
  end

  # GET /searchterms/new
  def new
    @searchterm = Searchterm.new
  end

  # GET /searchterms/1/edit
  def edit
  end

  # POST /searchterms
  # POST /searchterms.json
  def create
    @searchterm = Searchterm.new(searchterm_params)

    respond_to do |format|
      if @searchterm.save
        format.html { redirect_to @searchterm, notice: 'Searchterm was successfully created.' }
        format.json { render :show, status: :created, location: @searchterm }
      else
        format.html { render :new }
        format.json { render json: @searchterm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /searchterms/1
  # PATCH/PUT /searchterms/1.json
  def update
    respond_to do |format|
      if @searchterm.update(searchterm_params)
        format.html { redirect_to @searchterm, notice: 'Searchterm was successfully updated.' }
        format.json { render :show, status: :ok, location: @searchterm }
      else
        format.html { render :edit }
        format.json { render json: @searchterm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searchterms/1
  # DELETE /searchterms/1.json
  def destroy
    @searchterm.destroy
    respond_to do |format|
      format.html { redirect_to searchterms_url, notice: 'Searchterm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_searchterm
      @searchterm = Searchterm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def searchterm_params
      params.require(:searchterm).permit(:user_id, :search_term)
    end
end
