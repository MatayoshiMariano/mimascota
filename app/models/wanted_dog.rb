class WantedDog < ActiveRecord::Base
  include Dog
  acts_as_gmappable

end
