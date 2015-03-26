class AddColorToCharacteristics < ActiveRecord::Migration
  def change
    add_column :characteristics, :color, :string
  end
end
