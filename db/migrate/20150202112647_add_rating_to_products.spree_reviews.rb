# This migration comes from spree_reviews (originally 20110406083603)
class AddRatingToProducts < ActiveRecord::Migration
  def self.up
    if table_exists?('suites')
      add_column :suites, :avg_rating, :decimal, default: 0.0, null: false, precision: 7, scale: 5
      add_column :suites, :reviews_count, :integer, default: 0, null: false
    elsif table_exists?('spree_products')
      add_column :suites, :avg_rating, :decimal, default: 0.0, null: false, precision: 7, scale: 5
      add_column :suites, :reviews_count, :integer, default: 0, null: false
    end
  end

  def self.down
    if table_exists?('suites')
      remove_column :suites, :reviews_count
      remove_column :suites, :avg_rating
    elsif table_exists?('spree_products')
      remove_column :suites, :reviews_count
      remove_column :suites, :avg_rating
    end
  end
end
