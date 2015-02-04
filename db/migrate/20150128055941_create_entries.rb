class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.integer :contest_id
      t.text :description
      t.text :title
      
      t.timestamps
    end
  end
end
