class AddDiscoverIdToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :discover_id, :integer
  end
end
