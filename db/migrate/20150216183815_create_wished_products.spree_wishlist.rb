# This migration comes from spree_wishlist (originally 20091020183520)
class CreateWishedProducts < ActiveRecord::Migration
  def self.up
    create_table :wished_products do |t|
      t.references :suites
      t.references :wishlist
      t.text :remark

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :wished_products
  end
end
