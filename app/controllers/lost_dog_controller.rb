class LostDogController < ApplicationController

  def description
    @dog = LostDog.find params[:id]
    @markers = @dog.to_gmaps4rails
    render :template => 'shared/dog_description'
  end

end