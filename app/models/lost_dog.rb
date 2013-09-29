class LostDog < ActiveRecord::Base
  include Dog
  acts_as_gmappable
end
