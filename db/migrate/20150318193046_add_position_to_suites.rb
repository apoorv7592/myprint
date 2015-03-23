class AddPositionToSuites < ActiveRecord::Migration
  def change
    add_column :suites, :position, :integer
  	add_index :suites, :position
  end
end
