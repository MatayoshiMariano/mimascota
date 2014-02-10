class WantedDog < ActiveRecord::Base
  include Dog
  validates :name, :presence => { :message => "Debe ingresar el nombre." } 
  validates :age, :presence => { :message => "Debe ingresar la edad." }

  acts_as_gmappable :msg => "Debes ingresar una dirección." 

  def gmaps4rails_marker_picture
    {
     "picture" => ActionController::Base.helpers.asset_path('Map pins/Red/6.png'),
      "width" => 28,
      "height" => 43
    }
  end    
end
