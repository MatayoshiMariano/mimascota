class ChangeDogBreedReference < ActiveRecord::Migration
  def self.up
    change_table :wanted_dogs do |t|
    	t.remove :breed
			t.references :breed, index: true
    end
    change_table :lost_dogs do |t|
    	t.remove :breed
      t.references :breed, index: true
    end    
  end
end
