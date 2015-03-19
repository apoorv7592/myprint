class AddIndexToSlugSuites < ActiveRecord::Migration
  def change
  	add_index :suites, :slug
  end
end
