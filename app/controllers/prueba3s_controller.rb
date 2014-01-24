class Prueba3sController < ApplicationController
  before_action :set_prueba3, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :only => [:create, :update, :destroy]

  # GET /prueba3s
  # GET /prueba3s.json
  def index
    @prueba3s = Prueba3.all
  end

  # GET /prueba3s/1
  # GET /prueba3s/1.json
  def show
  end

  def hello
   # ActiveSupport::JSON.encode({ team: 'rails', players: '36' })
    aux = "prueba3nombre3"
   #aux = ActiveSupport::JSON.encode({ team: 'rails', players: '36' })
    @prueba3 = Prueba3.new(:nombre => aux)

    respond_to do |format|
      format.json { render :json => @prueba3 }
      format.xml { render xml: @prueba3 }
      format.html
    end   

   #render layout: false
  end


  def leer
    @var= params[:jsonstring]
    @var= ActiveSupport::JSON.decode(@var)
    prueba3 = Prueba3.new(@var)
    
  #  @var= params[:nombre]
  #  prueba3 = Prueba3.new(:nombre => @var)
    prueba3.save
  end

  # GET /prueba3s/new
  def new
    @prueba3 = Prueba3.new
  end

  # GET /prueba3s/1/edit
  def edit
  end

  # POST /prueba3s
  # POST /prueba3s.json
  def create
    @prueba3 = Prueba3.new(prueba3_params)

    respond_to do |format|
      if @prueba3.save
        format.html { redirect_to @prueba3, notice: 'Prueba3 was successfully created.' }
        format.json { render action: 'show', status: :created, location: @prueba3 }
      else
        format.html { render action: 'new' }
        format.json { render json: @prueba3.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prueba3s/1
  # PATCH/PUT /prueba3s/1.json
  def update
    respond_to do |format|
      if @prueba3.update(prueba3_params)
        format.html { redirect_to @prueba3, notice: 'Prueba3 was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @prueba3.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prueba3s/1
  # DELETE /prueba3s/1.json
  def destroy
    @prueba3.destroy
    respond_to do |format|
      format.html { redirect_to prueba3s_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prueba3
      @prueba3 = Prueba3.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prueba3_params
      params.require(:prueba3).permit(:nombre)
    end

end
