class RenameSuiteIdToProductIdInLikes < ActiveRecord::Migration
  def change
  	rename_column :likes, :suite_id, :product_id
  end
end
