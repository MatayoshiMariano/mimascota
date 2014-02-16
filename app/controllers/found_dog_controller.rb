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
      @old_wanted_dog = WantedDog.find(params[:wanted_dog_id])
      @dog_data = @old_wanted_dog
    else
      @old_wanted_dog = WantedDog.find_by user_id: current_user.id
      @old_lost_dog = LostDog.find(params[:lost_dog_id])
      @dog_data = @old_lost_dog
    end

    found_dog = FoundDog.new
    found_dog.name = @old_wanted_dog.name
    found_dog.age = @old_wanted_dog.age
    found_dog.breed_id = @dog_data.breed_id
    found_dog.color = @dog_data.color
    found_dog.user_id = @dog_data.user_id
    found_dog.description = @dog_data.description
    found_dog.image = @dog_data.image
    found_dog.latitude = @dog_data.latitude
    found_dog.longitude = @dog_data.longitude
    found_dog.save

    possibles_ids = DogPossibleOwner.where("user_id =" + current_user.id.to_s).destroy
    if @old_lost_dog
      @old_lost_dog.destroy
    end  
    @old_wanted_dog.destroy
    
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