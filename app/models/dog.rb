class Dog < ActiveRecord::Base
  belongs_to :user
  acts_as_gmappable

  validates :name, presence: true
  validates :age, presence: true
  validates :race, presence: true
  validates :color, presence: true
  validates :user, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "Av de mayo 123, Capital Federal"
  end  
end
