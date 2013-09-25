class WelcomeController < ApplicationController

	def index
    @json = Dog.all.to_gmaps4rails
	end

end