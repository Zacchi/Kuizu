class ValidatePercentagesController < ApplicationController
  before_action :set_validate_percentage, only: [:show, :edit, :update, :destroy]

  # GET /validate_percentages
  # GET /validate_percentages.json
  def index
   
    @randomNumber1 = 0;
    @randomNumber2 = 55;

  end

  def validateanswer
      format.html { redirect_to @validate_percentage, notice: 'Validate percentage was successfully created.' }
      format.json { render :show, status: :created, location: @validate_percentage }
  end
  
  # GET /validate_percentages/new
  def new
    @validate_percentage = ValidatePercentage.new
  end

  # GET /validate_percentages/1/edit
  def edit
  end

  # POST /validate_percentages
  # POST /validate_percentages.json
  def create
    @validate_percentage = ValidatePercentage.new(validate_percentage_params)

    respond_to do |format|
      if @validate_percentage.save
        format.html { redirect_to @validate_percentage, notice: 'Validate percentage was successfully created.' }
        format.json { render :show, status: :created, location: @validate_percentage }
      else
        format.html { render :new }
        format.json { render json: @validate_percentage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /validate_percentages/1
  # PATCH/PUT /validate_percentages/1.json
  def update
    respond_to do |format|
      if @validate_percentage.update(validate_percentage_params)
        format.html { redirect_to @validate_percentage, notice: 'Validate percentage was successfully updated.' }
        format.json { render :show, status: :ok, location: @validate_percentage }
      else
        format.html { render :edit }
        format.json { render json: @validate_percentage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /validate_percentages/1
  # DELETE /validate_percentages/1.json
  def destroy
    @validate_percentage.destroy
    respond_to do |format|
      format.html { redirect_to validate_percentages_url, notice: 'Validate percentage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_validate_percentage
      @validate_percentage = ValidatePercentage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def validate_percentage_params
      params[:validate_percentage]
    end
end
