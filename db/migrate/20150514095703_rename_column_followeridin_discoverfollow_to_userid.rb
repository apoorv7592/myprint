class RenameColumnFolloweridinDiscoverfollowToUserid < ActiveRecord::Migration
  def change
  	rename_column :discoverfollows, :follower_id, :user_id
  end
end
