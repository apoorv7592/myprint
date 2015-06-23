class CreateProductDiscovers < ActiveRecord::Migration
  def change
    create_table :product_discovers do |t|
      t.integer :product_id, null: false, default: 0
      t.integer :discover_id, null: false, default: 0

      t.timestamps
    end
    add_index :product_discovers, [:product_id, :discover_id]
  end
end
