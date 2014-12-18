class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :category
      t.integer :position
      t.boolean :enabled, default: false
    end
  end
end
