class CreateCusts < ActiveRecord::Migration
  def change
    create_table :custs do |t|
      t.string :gr_name
      t.string :gr_father_name
      t.string :gr_mother_name
      t.text :gr_address
      t.string :br_name
      t.string :br_father_name
      t.string :br_mother_name
      t.text :br_address
      t.integer :user_id
      t.integer :suite_id

      t.timestamps
    end
  end
end
