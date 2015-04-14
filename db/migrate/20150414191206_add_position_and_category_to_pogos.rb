class AddPositionAndCategoryToPogos < ActiveRecord::Migration
  def change
    add_column :pogos, :position, :integer
    add_column :pogos, :category, :string
    add_index :pogos, [:category, :position], :unique => true
  end
end
