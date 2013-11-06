class AddAttachmentImageToWantedDogs < ActiveRecord::Migration
  def self.up
    change_table :wanted_dogs do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :wanted_dogs, :image
  end
end
