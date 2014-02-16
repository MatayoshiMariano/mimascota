class CreateDogPossibleOwners < ActiveRecord::Migration
  def change
    create_table :dog_possible_owners do |t|
    	t.references :dog, index: true
    	t.references :user, index: true
      t.timestamps
    end
  end
end
