class AddPinToSpreeProducts < ActiveRecord::Migration
  def change
  	add_column :spree_products, :pin, :string
  end
end
