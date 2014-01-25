class CargadorController < ApplicationController
  protect_from_forgery :only => [:create, :update, :destroy]

  def ejemploJson
    aux = "pruebaNombre"

    @prueba = FoundDog.new(:name => aux)

    respond_to do |format|
      format.json { render :json => @prueba }
      format.xml { render xml: @prueba }
      format.html
    end
  end

  def subirPerroEncontrado
  	@errores= ""
  	#@var= params[:jsonstring]
    #@var= ActiveSupport::JSON.decode(@var)
    #perro = FoundDog.new(@var)

    perro = FoundDog.new(:name => "hjolaFoundDog3", :latitude => "-25.4198", :longitude => "-40.3012", :gmaps => true)

   # binding.pry
    if !perro.save
    	@errores = perro.errors.full_messages
    	logger.error @errores
	end

	#render :nothing => true
	redirect_to observador_perrosEncontrados_path
  end

  def subirPrueba3s
    prueba = Prueba3.new(:nombre => "asdhola")
    @errores= ""

    if !prueba.save
    	@errores= prueba.errors.full_messages
    	logger.error @errores
    end

  end
end
