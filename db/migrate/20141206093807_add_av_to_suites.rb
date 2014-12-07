class AddAvToSuites < ActiveRecord::Migration
  def change
  	add_column :suites, :available_on, :date
  	add_index :suites, :available_on
  end
end
