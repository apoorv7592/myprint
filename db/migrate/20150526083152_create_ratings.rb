class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :stars, default: 0
      t.integer :product_id
      t.integer :user_id
      t.integer :designer_id

      t.timestamps
    end
  end
end
