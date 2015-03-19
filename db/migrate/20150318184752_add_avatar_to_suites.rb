class AddAvatarToSuites < ActiveRecord::Migration
  def self.up
    add_attachment :suites, :avatar
  end

  def self.down
    remove_attachment :suites, :avatar
  end
end