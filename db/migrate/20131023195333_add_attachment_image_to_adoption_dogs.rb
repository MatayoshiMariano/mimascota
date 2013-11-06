class AddAttachmentImageToAdoptionDogs < ActiveRecord::Migration
  def self.up
    change_table :adoption_dogs do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :adoption_dogs, :image
  end
end
