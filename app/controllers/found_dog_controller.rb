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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_found_dog
      @found_dog = FoundDog.find(params[:id])
    end

end