class ChangeSpreeUserIdToUserIdInLikes < ActiveRecord::Migration
  def change
  	rename_column :likes, :spree_user_id, :user_id
  end
end
