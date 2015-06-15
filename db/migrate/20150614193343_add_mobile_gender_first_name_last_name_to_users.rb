class AddMobileGenderFirstNameLastNameToUsers < ActiveRecord::Migration
  def change
  	rename_column :spree_users, :name, :first_name
  	add_column :spree_users, :last_name, :string
  	add_column :spree_users, :phone, :string
  	add_column :spree_users, :gender, :string
  end
end
