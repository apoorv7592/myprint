class AddLikesNoToSuites < ActiveRecord::Migration
  def change
  	add_column :suites, :like_no, :integer, default: 0
  end
end
