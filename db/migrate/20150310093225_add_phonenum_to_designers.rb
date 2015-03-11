class AddPhonenumToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :phonenum, :string
  end
end
