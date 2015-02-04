class AddImageToEntryAttachements < ActiveRecord::Migration
  def self.up
    add_attachment :entry_attachements, :image
  end

  def self.down
    remove_attachment :entry_attachements, :image
  end
end
