class PruebaJsonsController < ApplicationController
  before_action :set_prueba_json, only: [:show, :edit, :update, :destroy]

  # GET /prueba_jsons
  # GET /prueba_jsons.json
  def index
    @prueba_jsons = PruebaJson.all
  end

  # GET /prueba_jsons/1
  # GET /prueba_jsons/1.json
  def show
  end

  # GET /prueba_jsons/new
  def new
    @prueba_json = PruebaJson.new
  end

  # GET /prueba_jsons/1/edit
  def edit
  end

  # POST /prueba_jsons
  # POST /prueba_jsons.json
  def create
    @prueba_json = PruebaJson.new(prueba_json_params)

    respond_to do |format|
      if @prueba_json.save
        format.html { redirect_to @prueba_json, notice: 'Prueba json was successfully created.' }
        format.json { render action: 'show', status: :created, location: @prueba_json }
      else
        format.html { render action: 'new' }
        format.json { render json: @prueba_json.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prueba_jsons/1
  # PATCH/PUT /prueba_jsons/1.json
  def update
    respond_to do |format|
      if @prueba_json.update(prueba_json_params)
        format.html { redirect_to @prueba_json, notice: 'Prueba json was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @prueba_json.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prueba_jsons/1
  # DELETE /prueba_jsons/1.json
  def destroy
    @prueba_json.destroy
    respond_to do |format|
      format.html { redirect_to prueba_jsons_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prueba_json
      @prueba_json = PruebaJson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prueba_json_params
      params[:prueba_json]
    end


end
