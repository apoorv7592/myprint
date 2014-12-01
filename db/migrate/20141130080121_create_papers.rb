class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :name
      t.text :description
      t.integer :weight

      t.timestamps
    end
  end
end
