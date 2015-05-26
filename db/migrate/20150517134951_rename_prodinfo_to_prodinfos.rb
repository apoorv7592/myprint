class RenameProdinfoToProdinfos < ActiveRecord::Migration
  def change
  	rename_table :prodinfo, :prodinfos
  end
end
