class WelcomeController < ApplicationController
	def index
    @json = WantedDog.all.to_gmaps4rails do |wanted_dog, marker|
      marker.json({ category: 'WantedDog'})
    end
	end

  def lost_dogs_json
    @json_lost_dogs = LostDog.all.to_gmaps4rails do |wanted_dog, marker|
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
end
