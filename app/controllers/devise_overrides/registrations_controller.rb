class DeviseOverrides::RegistrationsController < Devise::RegistrationsController

	before_filter :authenticate_user!
  
  def require_params
  	 params.require(:user).permit( :email, :password, :password_confirmation, :first_name, :last_name)
  end

  def devise_parameter_sanitizer
	  @devise_parameter_sanitizer ||= if defined?(ActionController::StrongParameters)
	    Devise::ParameterSanitizer.new(resource_class, resource_name, params)
	  else
	    Devise::BaseSanitizer.new(resource_class, resource_name, params)
	  end
	end
end