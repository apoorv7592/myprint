class RenameColumnFollowedidinDiscoverfollowToDiscoverid < ActiveRecord::Migration
  def change
  	rename_column :discoverfollows, :followed_id, :discover_id
  end
end
