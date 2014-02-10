class AdoptionController < ApplicationController
 before_action :set_adoption_dog, only: [:show, :edit, :update, :destroy]

  # GET /adoption
  # GET /adoption.json
  def index
    @adoption = Adoption_dog.all
  end

  # GET /articulos/1
  # GET /articulos/1.json
  def show
  end

  # GET /articulos/new
  def new
    @adoption_dog = Adoption_dog.new
  end

  # GET /articulos/1/edit
  def edit
  end

  # POST /articulos
  # POST /articulos.json
  def create
    @adoption_dog = Adoption_dog.new(adoption_dog_params)

    respond_to do |format|
      if @adoption_dog.save
        format.html { redirect_to @adoption_dog, notice: 'adoption_dog was successfully created.' }
        format.json { render action: 'show', status: :created, location: @adoption_dog }
      else
        format.html { render action: 'new' }
        format.json { render json: @adoption_dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articulos/1
  # PATCH/PUT /articulos/1.json
  def update
    respond_to do |format|
      if @adoption_dog.update(articulo_params)
        format.html { redirect_to @adoption_dog, notice: 'adoption_dog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @adoption_dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articulos/1
  # DELETE /articulos/1.json
  def destroy
    @adoption_dog.destroy
    respond_to do |format|
      format.html { redirect_to adoption_dog_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articulo
      @adoption_dog = Adoption_dog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def articulo_params
      params.require(:adoption_dog).permit(:Nombre, :Edad)
    end
end
 

