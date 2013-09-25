class AddLocalizationToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :latitude,  :float
    add_column :dogs, :longitude, :float
    add_column :dogs, :gmaps, :boolean
  end
end
