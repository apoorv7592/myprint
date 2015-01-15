class CreateDesigners < ActiveRecord::Migration
  def change
    create_table :designers do |t|
      t.string :name
      t.text :about
      t.boolean :active
      t.string :city

      t.timestamps
    end
  end
end
