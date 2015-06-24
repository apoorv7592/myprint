class AddAvgRatingToSpreeProducts < ActiveRecord::Migration
  def change
  	add_column :spree_products, :avg_rating, :integer, default: 0
  end
end
