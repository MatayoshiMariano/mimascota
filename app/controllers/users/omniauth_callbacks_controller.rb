class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    auth = request.env['omniauth.auth']

    user = User.find_by_uid(auth['uid'])

    if !user.nil? && user.access_token.nil?
      user.delete
    end

    @user = User.find_for_facebook_oauth(auth, current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      fb_access_token = auth['credentials']['token']
      @user.access_token = fb_access_token
      @user.save!
      #@user.congrats_email
      # Resque.enqueue(FetchUserInfoJob, @user.id, fb_access_token)
    else
      session['devise.facebook_data'] = auth
      redirect_to new_user_registration_url
    end
  end

  def after_omniauth_failure_path_for(scope)
    root_path
  end
end