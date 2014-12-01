class CreateJoinTablePaperSuite < ActiveRecord::Migration
  def change
    create_join_table :Papers, :Suites do |t|
      t.index [:paper_id, :suite_id]
      t.index [:suite_id, :paper_id]
    end
  end
end
