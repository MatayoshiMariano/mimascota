class CreateWantedDogs < ActiveRecord::Migration
  def change
    create_table :wanted_dogs do |t|
      t.string :name
      t.string :age
      t.string :breed
      t.string :color
      t.references :user, index: true
      t.text :description
      t.string :image
      t.string :last_seen_on
      t.date :last_seen_time

      t.timestamps
    end
  end
end
