class WelcomeController < ApplicationController

	def index
    @json = WantedDog.all.to_gmaps4rails
	end

end