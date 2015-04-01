class CreateJoinTableDimsSuite < ActiveRecord::Migration
  def change
    create_join_table :dimensions, :suites do |t|
       t.index [:dimension_id, :suite_id]
       t.index [:suite_id, :dimension_id]
    end
  end
end
