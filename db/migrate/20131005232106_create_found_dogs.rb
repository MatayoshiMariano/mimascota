class CreateFoundDogs < ActiveRecord::Migration
  def change
    create_table :found_dogs do |t|
      t.string :name
      t.string :age
      t.string :breed
      t.string :color
      t.references :user, index: true
      t.text :description
      t.string :image
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps      
    end
  end
end
