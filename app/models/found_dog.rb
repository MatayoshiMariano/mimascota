class FoundDog < ActiveRecord::Base
  include Dog
  acts_as_gmappable

  def gmaps4rails_marker_picture
    {
     "picture" => ActionController::Base.helpers.asset_path('Map pins/Blue/6.png'),
      "width" => 28,
      "height" => 43,
    }
  end
end
