class AdoptionDogController < ApplicationController

  def description
    @dog = AdoptionDog.find params[:id]
    @markers = @dog.to_gmaps4rails
    render :template => 'shared/dog_description'
  end

  def show
    @dog = AdoptionDog.find(params[:id])
    @markers = @dog.to_gmaps4rails
  end  

  def has_been_adopted
    dog = AdoptionDog.find(params[:id])
    dog.adopted = true
    dog.save
    redirect_to adoption_dog_path(dog)
  end  

  def new
    @dog = AdoptionDog.new
  end

  def create
    @dog = AdoptionDog.new(adoption_dog_params)

    respond_to do |format|
      if params[:address] != ''
        coords = Gmaps4rails.geocode(params[:address])
        @dog.latitude = coords[0][:lat]
        @dog.longitude = coords[0][:lng]
      end 

      @dog.user = current_user
      if @dog.save
        format.html { redirect_to @dog, notice: 'La publicación de su mascota ha sido exitosa.' }
      else
        format.html { render action: 'new' }
      end
    end
  end 

  def index
    @dogs = AdoptionDog.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def adoption_dog_params
    params.require(:dog).permit(:name, :age, :breed_id, :color, :description, :address, :image, :adopted)
  end
end