class CreateDesignerratings < ActiveRecord::Migration
  def change
    create_table :designerratings do |t|
      t.integer :stars, default: 0
      t.integer :user_id
      t.integer :designer_id

      t.timestamps
    end
  end
end
