class AddSpreeProdIdToProductDiscovers < ActiveRecord::Migration
  def change
  	add_column :product_discovers, :spree_product_id, :integer
  end
end
