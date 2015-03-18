class AddExperienceToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :experience, :string
  end
end
