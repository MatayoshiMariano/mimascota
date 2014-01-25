class ObservadorController < ApplicationController

  def perrosEncontrados
  	@perros = FoundDog.all
  end

end
