class AddSuiteIdToProducts < ActiveRecord::Migration
  def change
  	add_column :spree_products, :suite_id, :integer
  	add_index :spree_products, :suite_id
  end
end
