class CreateDesignerreviews < ActiveRecord::Migration
  def change
    create_table :designerreviews do |t|

      t.string :name
      t.string :location
      t.integer :rating
      t.text :title
      t.text :review
      t.boolean :approved, default: false
      t.integer :user_id
      t.string :ip_address
      t.string :locale
      t.boolean :show_identifier, default: true
      t.integer :designer_id

      t.timestamps
    end
    add_index :designerreviews, :designer_id
  end
end
