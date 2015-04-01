class CreateJoinTableTrmSuite < ActiveRecord::Migration
  def change
    create_join_table :trims, :suites do |t|
      t.index [:trim_id, :suite_id]
      t.index [:suite_id, :trim_id]
    end
  end
end
