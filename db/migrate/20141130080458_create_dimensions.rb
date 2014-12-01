class CreateDimensions < ActiveRecord::Migration
  def change
    create_table :dimensions do |t|
      t.string :name
      t.float :width
      t.float :height

      t.timestamps
    end
  end
end
