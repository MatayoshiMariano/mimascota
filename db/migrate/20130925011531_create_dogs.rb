class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :age
      t.string :race
      t.string :color
      t.references :user, index: true
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
