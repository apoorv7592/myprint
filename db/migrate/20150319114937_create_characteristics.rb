class CreateCharacteristics < ActiveRecord::Migration
  def change
  	
    
    create_table :characteristics do |t|
      t.string :name
      t.integer :suite_id
      t.integer :variant_id

      t.timestamps
    end
  end
end
