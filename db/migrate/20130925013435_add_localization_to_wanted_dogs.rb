class AddLocalizationToWantedDogs < ActiveRecord::Migration
  def change
    add_column :wanted_dogs, :latitude,  :float
    add_column :wanted_dogs, :longitude, :float
    add_column :wanted_dogs, :gmaps, :boolean
  end
end
