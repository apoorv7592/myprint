class RemoveProductsDiscovers < ActiveRecord::Migration
  def change
  	drop_table :product_discovers
  end
end
