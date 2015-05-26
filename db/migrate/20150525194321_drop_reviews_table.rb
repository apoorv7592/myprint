class DropReviewsTable < ActiveRecord::Migration
  def change
  	drop_table :spree_reviews
  end
end
