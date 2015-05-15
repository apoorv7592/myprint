class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.float :length
      t.float :width
      t.float :height
      t.string :size
      t.string :material
      t.string :instructions
      t.integer :product_id

      t.timestamps
    end
  end
end
