class WelcomeController < ApplicationController
	def index
    @json = WantedDog.all.to_gmaps4rails do |wanted_dog, marker|
      marker.json({ category: 'WantedDog'})
    end
	end

  def lost_dogs_json
    @json_lost_dogs = LostDog.all.to_gmaps4rails do |lost_dog, marker|
      marker.json({ category: 'LostDog'})
    end
    render json: @json_lost_dogs
  end

  def wanted_dogs_json
    @json_wanted_dogs = WantedDog.all.to_gmaps4rails do |wanted_dog, marker|
      marker.json({ category: 'WantedDog'})
    end
    render json: @json_wanted_dogs    
  end

  def adopt_dogs_json
    @json_adopt_dogs = AdoptionDog.all.to_gmaps4rails do |adoption_dog, marker|
      marker.json({ category: 'AdoptDogs'})
    end
    render json: @json_adopt_dogs    
  end

  def found_dogs_json
    @json_found_dogs = FoundDog.all.to_gmaps4rails do |found_dog, marker|
      marker.json({ category: 'FoundDogs'})
    end
    render json: @json_found_dogs    
  end

end
