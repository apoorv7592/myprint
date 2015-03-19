class RatingsMigration < ActiveRecord::Migration
  def change
  	  create_table :ratings do |t|
      t.integer :stars, :default => 0
      t.references :suite
      t.references :user
  end
end
end
