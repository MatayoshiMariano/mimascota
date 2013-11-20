class FoundDogController < ApplicationController

  def description
    @dog = FoundDog.find params[:id]
    @markers = @dog.to_gmaps4rails
    render :template => 'shared/dog_description'
  end

end