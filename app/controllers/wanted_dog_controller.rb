class WantedDogController < ApplicationController
   include Gmaps4rails::ActsAsGmappable
   before_action :set_wanted_dog, only: [:destroy]
  # TODO hecho para salvar error en pruebas
  def authenticate
  end

  # GET /lost_dog
  def index
    @wanted_dogs = WantedDog.all
  end

  # GET /lost_dog/1
  def show
    @dog = WantedDog.find(params[:id])
    @markers = @dog.to_gmaps4rails
  end

  # GET /lost_dog/new
  def new
    @wanted_dog = WantedDog.new    
  end

  # GET /lost_dog/1/edit
  def edit
  end

  # POST /lost_dog
  def create
    @wanted_dog = WantedDog.new(wanted_dog_params)

    respond_to do |format|
      if params[:address] != ''
        coords = Gmaps4rails.geocode(params[:address])
        @wanted_dog.latitude = coords[0][:lat] || -34.5843
        @wanted_dog.longitude = coords[0][:lng] || -58.4843
      end 

      @wanted_dog.user = current_user
      if @wanted_dog.save
        format.html { redirect_to @wanted_dog, notice: 'La publicación de su mascota
           ha sido exitosa. Deseamos que la recupere pronto.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /lost_dog/1
  def update
    respond_to do |format|
      if @wanted_dog.update(wanted_dog_params)
        format.html { redirect_to @wanted_dog, notice: 'WantedDog was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /lost_dog/1
  def destroy
    @wanted_dog.destroy
    respond_to do |format|
      format.html { redirect_to wanted_dog_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wanted_dog
      @wanted_dog = WantedDog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wanted_dog_params
      params.require(:wanted_dog).permit(:name, :age, :breed_id, :color, :description, :address, :image)
    end

  def description
    @dog = WantedDog.find params[:id]
    @markers = @dog.to_gmaps4rails
    render :template => 'shared/dog_description'
  end

  def index
    @dogs = WantedDog.all
  end

end