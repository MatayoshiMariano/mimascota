class AddAdoptedFieldtoAdoptionDog < ActiveRecord::Migration
  def self.up
    change_table :adoption_dogs do |t|
			t.boolean :adopted
    end  
  end
end
