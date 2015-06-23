class RemoveProdId < ActiveRecord::Migration
  def change
  	remove_column :product_discovers, :product_id
  end
end
