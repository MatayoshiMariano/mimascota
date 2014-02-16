class UsersController < ApplicationController
  def show
  	@lost_dog = LostDog.find(params[:dog_id])
  	dog_possible_owner = DogPossibleOwner.new
  	dog_possible_owner.dog = @lost_dog
  	dog_possible_owner.user = current_user
  	dog_possible_owner.save
    @contact = User.find(params[:id])
  end

  def my_pet
  	@dog = WantedDog.find_by user: current_user
  	if @dog
  		render :template => '/wanted_dog/show'
  	else
  		redirect_to root_path
  	end
  end

  def my_possibles
  	possibles_ids = DogPossibleOwner.where("user_id =" + current_user.id.to_s).pluck("dog_id")
  	if possibles_ids
  		Rails.logger.info("POSIBILIDADES!!!")
  		Rails.logger.info(possibles_ids)
	  	@lostdogs = LostDog.find(possibles_ids)
	  	if @lostdogs
	  		render :template => '/lost_dog/index'
	  	else
	  		redirect_to root_path
	  	end
	  end  	
  end  
end