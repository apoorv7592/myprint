class CreateSuites < ActiveRecord::Migration
  def change
    create_table :suites do |t|
      t.string :sku_id
      t.string :name
      t.text :description
      t.integer :designer_id
      t.integer :sub_category_id

      t.timestamps
    end
    add_index :suites, :designer_id
    add_index :suites, :sub_category_id

  end
end
