class AddColumnToDesigner < ActiveRecord::Migration
  def change
  	add_column :designers, :avg_rating, :integer
  	add_column :designers, :reviews_count, :integer
  end
end
