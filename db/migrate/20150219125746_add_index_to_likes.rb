class AddIndexToLikes < ActiveRecord::Migration
  def change
  	add_index(:likes, [:user_id, :suite_id], unique: true)
  end
end
