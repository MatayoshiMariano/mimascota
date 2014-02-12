class ObservadorController < ApplicationController
	protect_from_forgery :only => [:create, :update, :destroy]

  def obtenerCoincidencias
    dog = WantedDog.find params[:id] 
    @lost_dogs = LostDog.all
    @candidatos = Array.new
    maxDist = 100.00   

    @lost_dogs.each do |posMatch|
      dist = Math.sqrt ( (dog.latitude - posMatch.latitude) * (dog.latitude - posMatch.latitude) + (dog.longitude - posMatch.longitude) * (dog.longitude - posMatch.longitude) )

      if(dist <= maxDist) && (dog["breed"] == posMatch["breed"])
        @candidatos[@candidatos.length] = posMatch
      end      
    end    
  end

  def perrosBuscados
    @perros = WantedDog.all
  end

  def perrosEncontrados
  	@perros = FoundDog.all
  end

  def perrosPerdidos
  	@perros = LostDog.all
  end

  def usuarios
  	@usuarios = User.all
  end

  def loginCelular
  	var= params[:jsonString]
  	#var="{\"password\":\"123123123\",\"email\":\"test@server.com\"}" # para pruebas

  	logger.debug "var inspect = #{var.inspect}"  	

    var= ActiveSupport::JSON.decode(var)

	us= User.find_by_email(var["email"])

	if(us == nil)
		@res = -2
	else
		@res= -1

		if(us.valid_password?(var["password"]))
			@res= us["id"]
		end
	end	

	logger.debug "user id= #{@res}"

	render :json => @res
  end

end
