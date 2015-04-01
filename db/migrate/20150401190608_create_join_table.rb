class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :colors, :suites do |t|
      t.index [:color_id, :suite_id]
      t.index [:suite_id, :color_id]
    end
  end
end
