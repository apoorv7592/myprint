class AddReviewscountToSpreeproduct < ActiveRecord::Migration
  def change
  	add_column :spree_products, :reviews_count, :integer
  end
end
