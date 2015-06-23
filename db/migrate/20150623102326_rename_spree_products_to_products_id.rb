class RenameSpreeProductsToProductsId < ActiveRecord::Migration
  def change
  	rename_column :product_discovers, :spree_product_id, :product_id

  end
end
