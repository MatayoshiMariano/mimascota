class ObservadorController < ApplicationController

  def perrosEncontrados
  	@perros = FoundDog.all
  end

  def perrosPerdidos
  	@perros = LostDog.all
  end

  def usuarios
  	@usuarios = User.all
  end


end
