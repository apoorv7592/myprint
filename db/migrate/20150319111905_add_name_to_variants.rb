class AddNameToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :name, :string
  end
end
