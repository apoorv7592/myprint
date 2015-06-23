class CreateDiscoversProductsTable < ActiveRecord::Migration
  def change
    create_table :discovers_products do |t|
    	t.belongs_to :discover, index: true
    	t.belongs_to :spree_products, index: true
    end
  end
end
