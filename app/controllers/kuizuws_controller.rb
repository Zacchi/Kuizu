class KuizuwsController < ApplicationController
  before_action :set_kuizuw, only: [:show, :edit, :update, :destroy]

  # GET /kuizuws
  # GET /kuizuws.json
  def index
    @kuizuws = Kuizuw.all
  end

  # GET /kuizuws/1
  # GET /kuizuws/1.json
  def show
  end

  # GET /kuizuws/new
  def new
    @kuizuw = Kuizuw.new
  end

  # GET /kuizuws/1/edit
  def edit
  end

  # POST /kuizuws
  # POST /kuizuws.json
  def create
    @kuizuw = Kuizuw.new(kuizuw_params)

    respond_to do |format|
      if @kuizuw.save
        format.html { redirect_to @kuizuw, notice: 'Kuizuw was successfully created.' }
        format.json { render :show, status: :created, location: @kuizuw }
      else
        format.html { render :new }
        format.json { render json: @kuizuw.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kuizuws/1
  # PATCH/PUT /kuizuws/1.json
  def update
    respond_to do |format|
      if @kuizuw.update(kuizuw_params)
        format.html { redirect_to @kuizuw, notice: 'Kuizuw was successfully updated.' }
        format.json { render :show, status: :ok, location: @kuizuw }
      else
        format.html { render :edit }
        format.json { render json: @kuizuw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kuizuws/1
  # DELETE /kuizuws/1.json
  def destroy
    @kuizuw.destroy
    respond_to do |format|
      format.html { redirect_to kuizuws_url, notice: 'Kuizuw was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kuizuw
      @kuizuw = Kuizuw.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kuizuw_params
      params.require(:kuizuw).permit(:anumber)
    end
end
