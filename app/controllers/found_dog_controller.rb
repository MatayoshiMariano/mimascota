class FoundDogController < ApplicationController
  before_action :set_found_dog

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
