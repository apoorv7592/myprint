class RenameSuiteIdToProductIdLikes < ActiveRecord::Migration
  def change
  	rename_column :spree_products, :suite_id, :product_id
  end
end
