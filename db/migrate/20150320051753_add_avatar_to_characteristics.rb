class AddAvatarToCharacteristics < ActiveRecord::Migration

	  def self.up
	    add_attachment :characteristics, :avatar
	  end

	  def self.down
	    remove_attachment :characteristics, :avatar
	  end
end
