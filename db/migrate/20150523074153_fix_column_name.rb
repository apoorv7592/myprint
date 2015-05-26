class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :ratings, :suite_id, :product_id
  end
end
