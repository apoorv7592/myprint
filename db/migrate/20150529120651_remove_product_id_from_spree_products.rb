class RemoveProductIdFromSpreeProducts < ActiveRecord::Migration
  def change
  	remove_column :spree_products, :product_id
  end
end
