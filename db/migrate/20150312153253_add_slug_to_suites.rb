class AddSlugToSuites < ActiveRecord::Migration
  def change
  	add_column :suites, :slug, :string, unique: true
  end
end
