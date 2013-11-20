class AddAttachmentImageToLostDogs < ActiveRecord::Migration
  def self.up
    change_table :lost_dogs do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :lost_dogs, :image
  end
end
