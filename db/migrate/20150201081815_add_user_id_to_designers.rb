class AddUserIdToDesigners < ActiveRecord::Migration
  def change
  	add_column :designers, :user_id, :integer, default: 0, null: false
  end
end
