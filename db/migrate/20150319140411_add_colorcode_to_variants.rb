class AddColorcodeToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :colorcode, :string
  end
end
