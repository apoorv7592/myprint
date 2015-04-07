class AddAvatarToSuiteImages < ActiveRecord::Migration
  def self.up
    add_attachment :suite_images, :avatar
  end

  def self.down
    remove_attachment :suite_images, :avatar
  end
end
