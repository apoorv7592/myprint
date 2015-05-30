class RemoveLikeNoProducts < ActiveRecord::Migration
  def change
  	remove_column :spree_products, :like_no
  	add_column :spree_products, :like_no, :integer, default: 0
  end
end
