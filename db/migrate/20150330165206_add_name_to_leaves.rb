class AddNameToLeaves < ActiveRecord::Migration
  def change
    add_column :leafs, :name, :string
  end
end
