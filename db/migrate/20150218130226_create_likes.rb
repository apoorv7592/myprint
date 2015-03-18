class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :spree_user_id
      t.integer :suite_id

      t.timestamps
    end
    add_index :likes, :spree_user_id
    add_index :likes, :suite_id
  end
end
