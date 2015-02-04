class AddIsDesignerToUsers < ActiveRecord::Migration
  def change
  	add_column :spree_users, :is_designer, :boolean, default: false
  end
end
