class AddShippingPolicyAndOverviewToProducts < ActiveRecord::Migration
  def change
  	add_column :spree_products, :shipping, :text
  	add_column :spree_products, :overview, :text
  	add_column :spree_products, :cod, :boolean, default: false
  	add_column :spree_products, :delivery_time, :integer
  end
end
