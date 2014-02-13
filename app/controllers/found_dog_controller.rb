class FoundDogController < ApplicationController
  before_action :set_found_dog, only: [:destroy]

  def description
    @dog = FoundDog.find params[:id]
    @markers = @dog.to_gmaps4rails
    render :template => 'shared/dog_description'
  end  

  def destroy
    @found_dog.destroy
    redirect_to observador_perrosEncontrados_url
  end

  def index
    @dogs = FoundDog.all
  end

  def new
    if params[:wanted_dog_id]
      @dog = WantedDog.find(params[:wanted_dog_id])
    end
    
    if params[:lost_dog_id]
      @dog = LostDog.find(params[:lost_dog_id])
    end

    found_dog = FoundDog.new
    found_dog.name = @dog.name
    found_dog.age = @dog.age
    found_dog.breed_id = @dog.breed_id
    found_dog.color = @dog.color
    found_dog.user_id = @dog.user_id
    found_dog.description = @dog.description
    found_dog.image = @dog.image
    found_dog.latitude = @dog.latitude
    found_dog.longitude = @dog.longitude
    found_dog.save

    redirect_to found_dog
  end  

  def show
    @dog = FoundDog.find(params[:id])
    @markers = @dog.to_gmaps4rails
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_found_dog
      @found_dog = FoundDog.find(params[:id])
    end

end