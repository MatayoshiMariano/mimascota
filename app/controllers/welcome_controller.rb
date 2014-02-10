class WelcomeController < ApplicationController
	def index
    @json = WantedDog.all.to_gmaps4rails do |wanted_dog, marker|
    marker.infowindow render_to_string(partial: "info_window", locals: {controller: 'wanted_dog', object: wanted_dog})
    marker.json({ category: 'WantedDog'})
  end
	end

  def lost_dogs_json
    dog_json(LostDog, 'LostDog', 'lost_dog')
  end

  def wanted_dogs_json
    dog_json(WantedDog, 'WantedDog', 'wanted_dog')
  end

  def adopt_dogs_json
    dog_json(AdoptionDog, 'AdoptDogs', 'adoption_dog')
  end

  def found_dogs_json
    dog_json(FoundDog, 'FoundDogs', 'found_dog')
  end

private
  def dog_json(dogType, category, controller)
    dogs = dogType.all.to_gmaps4rails do |dog, marker|
      marker.infowindow render_to_string(partial: "info_window", locals: {controller: controller, object: dog})
      marker.json({ category: category})
    end
    render json: dogs        
  end

end
