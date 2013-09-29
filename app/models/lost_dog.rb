class LostDog < ActiveRecord::Base
  include Dog
  acts_as_gmappable



  def gmaps4rails_marker_picture
    {
     "picture" => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=|FF0000|000000" 
    }
  end    
end
