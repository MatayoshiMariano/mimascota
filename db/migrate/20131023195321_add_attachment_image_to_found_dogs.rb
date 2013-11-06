class AddAttachmentImageToFoundDogs < ActiveRecord::Migration
  def self.up
    change_table :found_dogs do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :found_dogs, :image
  end
end
