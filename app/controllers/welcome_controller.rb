class WelcomeController < ApplicationController
  #respond_to :json
	def index
    json_wanted_dogs = JSON.parse(WantedDog.all.to_gmaps4rails do |wanted_dog, marker|
      marker.json({ category: 'WantedDog'})
    end)
    json_lost_dogs  = JSON.parse(LostDog.all.to_gmaps4rails do |wanted_dog, marker|
      marker.json({ category: 'LostDog'})
    end)
    @json = (json_wanted_dogs + json_lost_dogs).to_json
    #@json = LostDog.all.to_gmaps4rails
	end

end