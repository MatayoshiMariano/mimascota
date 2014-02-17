class CargadorController < ApplicationController
  protect_from_forgery :only => [:create, :update, :destroy]

  def subirPerroPerdido
    logger.error "Inspeccion de parametros.........................."
    logger.error params.inspect

  	@errores= ""
  	@var= params[:jsonString]
    @var= ActiveSupport::JSON.decode(@var)

    f = File.new("app/assets/images/wanted_dogs/perro#{LostDog.last.id + 1}.jpg", "w+")  
    f.write(params[:fotoUp])
    f.close #cierro para q ande bien

    f = File.open("app/assets/images/wanted_dogs/perro#{LostDog.last.id + 1}.jpg")

    @var["image"] = f
    idBreed = Breed.find_by_label(@var["breed"])
    @var["breed_id"] = idBreed["id"]
    logger.error @var

    perro = LostDog.new(name: @var["name"], age: @var["age"], color: @var["color"], 
      user_id: @var["user_id"], description: @var["description"],
        image: @var["image"], latitude: @var["latitude"], longitude: @var["longitude"],
          gmaps: @var["gmaps"], breed_id: @var["breed_id"])

    # binding.pry
    if !perro.save
    	@errores = perro.errors.full_messages
    	logger.error @errores
	  end

    render :nothing => true
  end

  def cargarBreeds
    breed1 = Breed.new(:label => "Boxer")
    breed1.save

    render :nothing => true
  end
end
