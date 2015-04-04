class CreateJoinTableSuitesSubCategories < ActiveRecord::Migration
  def change
    create_join_table :sub_categories, :suites do |t|
      t.index [:sub_category_id, :suite_id]
      t.index [:suite_id, :sub_category_id]
    end
  end
end
