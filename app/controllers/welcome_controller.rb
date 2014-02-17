class WelcomeController < ApplicationController
	def index
    @json = WantedDog.all.to_gmaps4rails do |wanted_dog, marker|
    marker.infowindow render_to_string(partial: "info_window", locals: {controller: 'observador', action: 'obtenerCoincidencias', object: wanted_dog})
    marker.json({ category: 'WantedDog'})
  end
	end

  def lost_dogs_json
    dog_json(LostDog, 'LostDog', 'lost_dog', 'show')
  end

  def wanted_dogs_json
    dog_json(WantedDog, 'WantedDog', 'observador', 'obtenerCoincidencias')
  end

  def adopt_dogs_json
    dog_json(AdoptionDog, 'AdoptDogs', 'adoption_dog', 'show')
  end

  def found_dogs_json
    dog_json(FoundDog, 'FoundDogs', 'found_dog', 'show')
  end

private
  def dog_json(dogType, category, controller, action)
    dogs = dogType.all.to_gmaps4rails do |dog, marker|
      marker.infowindow render_to_string(partial: "info_window", locals: {controller: controller, action:action, object: dog})
      marker.json({ category: category})
    end
    render json: dogs        
  end

end
