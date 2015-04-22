class AddPricetoSuites < ActiveRecord::Migration
  def change
  	add_column :suites,:price,:integer
  end
end
