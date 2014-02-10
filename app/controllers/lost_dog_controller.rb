class LostDogController < ApplicationController
   include Gmaps4rails::ActsAsGmappable
   before_action :set_lostdog, only: [:destroy]
  # TODO hecho para salvar error en pruebas
  def authenticate
  end

  def description
    @dog = LostDog.find params[:id]
    @markers = @dog.to_gmaps4rails
    render :template => 'shared/dog_description'
  end 

  # GET /lost_dog
  def index
    @lostdogs = LostDog.all
  end

  # GET /lost_dog/1
  def show
    @lostdog = LostDog.find(params[:id])
    @markers = @lostdog.to_gmaps4rails
  end

  # GET /lost_dog/new
  def new
    @dog = LostDog.new    
  end

  # GET /lost_dog/1/edit
  def edit
  end

  # POST /lost_dog
  def create
    @dog = LostDog.new(lostdog_params)
    @dog.user = current_user
    if params[:address].present?
      coords = Gmaps4rails.geocode(params[:address])
      @dog.latitude = coords[0][:lat]
      @dog.longitude = coords[0][:lng]
    end

    if @dog.save
      redirect_to @dog, notice: 'La publicación de la mascota encontrada
         ha sido exitosa. Deseamos que aparezca pronto el dueño.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /lost_dog/1
  def update
    respond_to do |format|
      if @LostDog.update(lostdog_params)
        format.html { redirect_to @lostdog, notice: 'LostDog was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /lost_dog/1
  def destroy
    @lostdog.destroy
    respond_to do |format|
      format.html { redirect_to lost_dog_index_path }
    end
  end

  def description
    @dog = LostDog.find params[:id]
    @markers = @dog.to_gmaps4rails
    render :template => 'shared/dog_description'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lostdog
      @lostdog = LostDog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lostdog_params
      params.require(:lostdog).permit(:age, :breed, :color, :description, :address, :image)
    end
    
end