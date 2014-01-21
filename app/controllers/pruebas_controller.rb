class PruebasController < ApplicationController
  before_action :set_prueba, only: [:show, :edit, :update, :destroy]

  # GET /pruebas
  # GET /pruebas.json
  def index
    @pruebas = Prueba.all
  end

  # GET /pruebas/1
  # GET /pruebas/1.json
  def show
  end

  # GET /pruebas/new
  def new
    @prueba = Prueba.new
  end

  # GET /pruebas/1/edit
  def edit
  end

  # POST /pruebas
  # POST /pruebas.json
  def create
    @prueba = Prueba.new(prueba_params)

    respond_to do |format|
      if @prueba.save
        format.html { redirect_to @prueba, notice: 'Prueba was successfully created.' }
        format.json { render action: 'show', status: :created, location: @prueba }
      else
        format.html { render action: 'new' }
        format.json { render json: @prueba.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pruebas/1
  # PATCH/PUT /pruebas/1.json
  def update
    respond_to do |format|
      if @prueba.update(prueba_params)
        format.html { redirect_to @prueba, notice: 'Prueba was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @prueba.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pruebas/1
  # DELETE /pruebas/1.json
  def destroy
    @prueba.destroy
    respond_to do |format|
      format.html { redirect_to pruebas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prueba
      @prueba = Prueba.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prueba_params
      params.require(:prueba).permit(:nombre)
    end
end
