module Dog
  def self.included(base)
    base.belongs_to :user    
  #  base.validates :name, presence: true
  #  base.validates :age, presence: true
  #  base.validates :breed, presence: true
  #  base.validates :color, presence: true
  #  base.validates :user, presence: true
  #  base.validates :description, presence: true
  #  base.validates :image, presence: true
  #  base.validates :latitude, presence: true
  #  base.validates :longitude, presence: true
  end 

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.latitude}, #{self.longitude}"
  end
end
