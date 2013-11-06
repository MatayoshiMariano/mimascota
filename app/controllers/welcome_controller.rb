class WelcomeController < ApplicationController
	def index
    @json = WantedDog.all.to_gmaps4rails do |wanted_dog, marker|
    marker.infowindow render_to_string(partial: "info_window", locals: {descr_url: wanted_dog_description_path, object: wanted_dog})
      marker.json({ category: 'WantedDog'})
    end
	end

  def lost_dogs_json
    dog_json(LostDog, 'LostDog', lost_dog_description_path)
  end

  def wanted_dogs_json
    dog_json(WantedDog, 'WantedDog', lost_dog_description_path)
  end

  def adopt_dogs_json
    dog_json(AdoptionDog, 'AdoptDogs', lost_dog_description_path)
  end

  def found_dogs_json
    dog_json(FoundDog, 'FoundDogs', lost_dog_description_path)
  end

private
  def dog_json(dogType, category, description_url)
    dogs = dogType.all.to_gmaps4rails do |dog, marker|
      marker.infowindow render_to_string(partial: "info_window", locals: {descr_url: description_url, object: dog})
      marker.json({ category: category})
    end
    render json: dogs        
  end

end
