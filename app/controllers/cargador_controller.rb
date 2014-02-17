class CargadorController < ApplicationController
  protect_from_forgery :only => [:create, :update, :destroy]

  def ejemploJson
    @prueba = WantedDog.new(id: "400", :name => "hjolaFoundDog3", :age => "3",
      :breed => "Beagle", :color => "blanco", :user_id => "2", 
       :description => "miDescripcion", :latitude => "-25.4198", :longitude => "-40.3012", :gmaps => true)

    render :json => @prueba    
  end


  def subirPerroBuscado
    logger.error "Inspeccion de parametros.........................."
    logger.error params.inspect

  	@errores= ""
  	@var= params[:jsonString]
    @var= ActiveSupport::JSON.decode(@var)

    f = File.new("app/assets/images/wanted_dogs/perro#{WantedDog.last.id + 1}.jpg", "w+")  
    f.write(params[:fotoUp])
    f.close #cierro para q ande bien

    f = File.open("app/assets/images/wanted_dogs/perro#{WantedDog.last.id + 1}.jpg")

    @var["image"] = f
    idBreed = Breed.find_by_label(@var["breed"])
    @var["breed"] = idBreed
    logger.error @var

    perro = WantedDog.new(@var)

    # binding.pry
    if !perro.save
    	@errores = perro.errors.full_messages
    	logger.error @errores
	  end

    render :nothing => true
  end


  def testSubirPerroBuscado
  	@errores= ""
  #	@var= '{"id":400,"name":"hjolaFoundDog3","age":"3","breed":"razaPerro","color":"blanco","user_id":1,"description":"miDescripcion","image":"/system/found_dogs/images/000/000/400/original/dog_mock.jpg?1391117461","latitude":-25.4198,"longitude":-40.3012,"gmaps":true,"image_file_name":"dog_mock.jpg","image_content_type":"image/jpeg","image_file_size":6712,"image_updated_at":"2014-01-30T21:31:01.362Z"}'
  
    @var = "{\"breed\":\"Beagle\",\"gmaps\":\"true\",\"color\":\"agagaegfag\",\"description\":\"agagaegfag\",\"name\":\"Juan2\",\"age\":\"20\",\"longitude\":\"10.3012\",\"user_id\":\"1\",\"latitude\":\"10.4198\"}"
    @var= ActiveSupport::JSON.decode(@var)

    @var["image"] = File.new("app/assets/images/wanted_dogs/perro1.jpg")
    perro = WantedDog.new(@var)    

   # binding.pry
    if !perro.save
    	@errores = perro.errors.full_messages
    	logger.error @errores
	  end

	  render :nothing => true
  end


  def testSubirPerroBuscadoCompleto
    @errores= ""
    @var= '{"id":400,"name":"hjolaFoundDog3","age":"3","breed":"razaPerro","color":"blanco","user_id":2,"description":"miDescripcion","image":"/system/found_dogs/images/000/000/400/original/dog_mock.jpg?1391117461","latitude":-25.4198,"longitude":-40.3012,"gmaps":true,"image_file_name":"dog_mock.jpg","image_content_type":"image/jpeg","image_file_size":6712,"image_updated_at":"2014-01-30T21:31:01.362Z"}'
    @var= ActiveSupport::JSON.decode(@var)

    f = File.new("app/assets/images/dog_mock.jpg", "w+")
    f.write(@var["image"])

    @var["image"] = f

    perro = WantedDog.new(@var) 

   # binding.pry
    if !perro.save
      @errores = perro.errors.full_messages
      logger.error @errores
    end

    render :nothing => true
  end

  def cargarBreeds
    breed1 = Breed.new(:label => "Beagle")
    breed1.save

    render :nothing => true
  end
end
