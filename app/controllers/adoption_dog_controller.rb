class AdoptionDogController < ApplicationController

  def description
    @dog = AdoptionDog.find params[:id]
    @markers = @dog.to_gmaps4rails
    render :template => 'shared/dog_description'
  end

end