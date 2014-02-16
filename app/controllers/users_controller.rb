class UsersController < ApplicationController
  def show
  	@lost_dog = LostDog.find(params[:dog_id])
  	dog_possible_owner = DogPossibleOwner.new
  	dog_possible_owner.dog = @lost_dog
  	dog_possible_owner.user = current_user
  	dog_possible_owner.save
    @contact = User.find(params[:id])
  end
end