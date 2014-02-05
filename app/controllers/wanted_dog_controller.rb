class WantedDogController < ApplicationController

  def description
    @dog = WantedDog.find params[:id]
    @markers = @dog.to_gmaps4rails
    render :template => 'shared/dog_description'
  end

  def show
    @dog = WantedDog.find(params[:id])
    @markers = @dog.to_gmaps4rails
  end  

  def index
    @dogs = WantedDog.all
  end

end