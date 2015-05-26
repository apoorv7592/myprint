class RenamePropertyToProdinfo < ActiveRecord::Migration
  def change
  	rename_table :properties, :prodinfo
  end
end
