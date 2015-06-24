class AddAvgRatingToProducts < ActiveRecord::Migration
  def change
  	add_column :spree_products, :avg_rating, :intger, default: 0
  end
end
