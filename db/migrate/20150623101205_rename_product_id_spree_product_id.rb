class RenameProductIdSpreeProductId < ActiveRecord::Migration
  def change
  	rename_column :product_discovers, :product_id, :spree_product_id
  end
end
