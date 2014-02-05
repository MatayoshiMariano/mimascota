class LostDog < ActiveRecord::Base
  include Dog
  acts_as_gmappable :msg => "Debes ingresar una dirección."

  def gmaps4rails_marker_picture
    {
     "picture" => ActionController::Base.helpers.asset_path('Map pins/Black/6.png'),
      "width" => 28,
      "height" => 43     
    }
  end    
end
