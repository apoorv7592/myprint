class AddAvgratingToSpreeproducts < ActiveRecord::Migration
  def change
  	add_column :spree_products, :avg_rating, :integer
  end
end
