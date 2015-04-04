class CreateJoinTableSuitesTrims < ActiveRecord::Migration
  def change
    create_join_table :suites, :trims do |t|
      t.index [:suite_id, :trim_id]
      t.index [:trim_id, :suite_id]
    end
  end
end
