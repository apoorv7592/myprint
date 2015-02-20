class RenameSuitesIdWishedProducts < ActiveRecord::Migration
  def change
  	rename_column :spree_wished_products, :suites_id, :suite_id
  end
end
