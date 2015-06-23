class RenameUserIdToSpreeSerIdDiscoverfollows < ActiveRecord::Migration
  def change
  	rename_column :discoverfollows, :user_id, :spree_user_id
  end
end
