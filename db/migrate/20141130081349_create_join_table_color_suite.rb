class CreateJoinTableColorSuite < ActiveRecord::Migration
  def change
    create_join_table :Colors, :Suites do |t|
      t.index [:color_id, :suite_id]
      t.index [:suite_id, :color_id]
    end
  end
end
