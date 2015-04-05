class CreateSuiteImages < ActiveRecord::Migration
  def change
    create_table :suite_images do |t|
      t.integer :suite_id
      t.string :type
      t.string :name

      t.timestamps
    end
  end
end
