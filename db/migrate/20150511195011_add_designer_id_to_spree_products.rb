class AddDesignerIdToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :designer_id, :integer
  end
end
