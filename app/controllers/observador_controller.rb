class ObservadorController < ApplicationController

  def perrosEncontrados
  	@perros = FoundDog.all
  end

  def destroyPerroEncontrado
    @perro.destroy
    redirect_to observador_perrosEncontrados_path
  end
end
