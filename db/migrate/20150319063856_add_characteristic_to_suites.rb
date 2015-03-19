class AddCharacteristicToSuites < ActiveRecord::Migration
  def change
  	add_column :suites, :characteristic, :string
  end
end
