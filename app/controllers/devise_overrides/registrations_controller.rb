class DeviseOverrides::RegistrationsController < Devise::RegistrationsController

	before_filter :authenticate_user!
  
  def require_params
  	 params.require(:user).permit( :email, :password, :password_confirmation, :first_name, :last_name)
  end
end