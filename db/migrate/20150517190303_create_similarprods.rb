class CreateSimilarprods < ActiveRecord::Migration
  def change
    create_table :similarprods do |t|
      t.string :product_name
      t.integer :product_id
      t.integer :prod1
      t.integer :prod2
      t.integer :prod3
      t.integer :prod4
      t.integer :prod5
      t.integer :prod6
      t.integer :prod7
      t.integer :prod8

      t.timestamps
    end
  end
end
