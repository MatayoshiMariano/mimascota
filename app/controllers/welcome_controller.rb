class WelcomeController < ApplicationController
	def index
    @json = WantedDog.all.to_gmaps4rails do |wanted_dog, marker|
      marker.infowindow render_to_string(partial: "info_window", locals: { object: wanted_dog })
      marker.json({ category: 'WantedDog'})
    end
	end

  def lost_dogs_json
    dog_json(LostDog, 'LostDog')
  end

  def wanted_dogs_json
    dog_json(WantedDog, 'WantedDog')
  end

  def adopt_dogs_json
    dog_json(AdoptionDog, 'AdoptDogs')
  end

  def found_dogs_json
    dog_json(FoundDog, 'FoundDogs')
  end

private
  def dog_json(dogType, category)
    dogs = dogType.all.to_gmaps4rails do |dog, marker|
      marker.infowindow render_to_string(partial: "info_window", locals: { object: dog })
      marker.json({ category: category})
    end
    render json: dogs        
  end

end
