class AddSkillsToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :skills, :string
  end
end
