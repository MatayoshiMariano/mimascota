class ObservadorController < ApplicationController
	protect_from_forgery :only => [:create, :update, :destroy]

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
