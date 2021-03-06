class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  validates :first_name, :last_name, :birthday, presence: true

	def fullname
		self.first_name + ' ' + self.last_name
	end

  def get_my_wanted_pet
    return WantedDog.find_by user_id: self.id
  end


  def has_pet_in_adoptions
    if AdoptionDog.find_by user_id: self.id
      return true
    end
    return false
  end
  
  def has_pet
    if WantedDog.find_by user_id: self.id
      Rails.logger.info("TIENE MASCOTA!!!")
      return true
    end
    Rails.logger.info("NO TIENE MASCOTA!!!")
    return false
  end

  def has_possibles
    if DogPossibleOwner.find_by user_id: self.id
      Rails.logger.info("TIENE POSIBILIDADES!!!")
      return true
    end
    Rails.logger.info("NO TIENE POSIBILIDADES!!!")
    return false
  end 

  # Required methods to login using Facebook connect and Devise
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.where(email: auth.info.email).first
      if user.nil?
        user = User.create!(name:auth.extra.raw_info.name,
                            first_name:auth.extra.raw_info.first_name,
                            last_name:auth.extra.raw_info.last_name,
                            birthday: Date.strptime(auth.extra.raw_info.birthday, "%m/%d/%Y"),
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password: Devise.friendly_token[0,20])
      else
        user.provider = auth.provider
        user.uid = auth.uid
        user.update_attributes(user.attributes)
      end
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end
end
