module Dog
  def self.included(base)
   
    base.has_attached_file :image
    base.belongs_to :user    
    base.validates :breed, presence: { message: "Debe ingresar la raza." } 
    base.validates :color, presence: { message: "Debe ingresar el color del pelaje." } 
    base.validates :user, presence: true
    base.validates :description, presence: { message: "Debe ingresar una descripción" } 
    base.validates :image, presence: { message: "Debe publicar una imagen." } 
    base.validates :latitude, presence: { message: nil } 
    base.validates :longitude, presence: { message: nil } 
  end 

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.latitude}, #{self.longitude}"
  end
end
