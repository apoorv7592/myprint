class CreateDiscovers < ActiveRecord::Migration
  def change
    create_table :discovers do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
