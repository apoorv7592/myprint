class AddIndexToStories < ActiveRecord::Migration
  def change
  	add_index :stories, :actor_id
  	add_index :stories, :object_id
  end
end
