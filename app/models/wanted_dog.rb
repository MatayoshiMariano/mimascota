class WantedDog < ActiveRecord::Base
  include Dog
  acts_as_gmappable

  def gmaps4rails_marker_picture
    {
     "picture" => "assets/Map pins/Gray/6.png",
      "width" => 28,
      "height" => 43
    }
  end    
end
