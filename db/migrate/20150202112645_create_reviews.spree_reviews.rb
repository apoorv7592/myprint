# This migration comes from spree_reviews (originally 20081020220724)
class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :suite_id
      t.string  :name
      t.string  :location
      t.integer :rating
      t.text    :title
      t.text    :review
      t.boolean :approved, default: false
      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
