class CambiarBreedFieldFoundDog < ActiveRecord::Migration
  def self.up
    change_table :found_dogs do |t|
    	t.remove :breed
			t.references :breed, index: true
    end
  end
end
