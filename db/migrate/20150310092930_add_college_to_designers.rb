class AddCollegeToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :college, :string
  end
end
