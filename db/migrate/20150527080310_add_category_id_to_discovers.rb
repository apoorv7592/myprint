class AddCategoryIdToDiscovers < ActiveRecord::Migration
  def change
    add_column :discovers, :category_id, :integer
  end
end
