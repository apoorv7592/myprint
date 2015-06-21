class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :actor_id
      t.string :actor_type
      t.string :verb
      t.integer :object_id
      t.string :object_type
      t.string :description

      t.timestamps
    end
  end
end
