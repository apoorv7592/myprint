class AddAvatarToDiscovers < ActiveRecord::Migration
   def self.up
    add_attachment :discovers, :avatar
   end

   def self.down
    remove_attachment :discovers, :avatar
   end
end
