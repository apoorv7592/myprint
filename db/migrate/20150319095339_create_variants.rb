class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|

      add_column :variants, :name, :string

      t.timestamps
    end
  end
end
