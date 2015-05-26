class CreateSpreeReviews < ActiveRecord::Migration
  def change
    create_table :spree_reviews do |t|
      t.integer :product_id
      t.string :name
      t.string :location
      t.integer :rating
      t.text :title
      t.text :review
      t.boolean :approved, default: false
      t.integer :user_id
      t.string :ip_address
      t.string :locale
      t.boolean :show_identifier, default: true
      t.integer :designer_id

      t.timestamps
    end
    add_index :spree_reviews, :product_id
    add_index :spree_reviews, :designer_id
  end
end
