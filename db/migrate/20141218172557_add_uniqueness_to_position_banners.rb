class AddUniquenessToPositionBanners < ActiveRecord::Migration
  def change
  	remove_column :banners, :position
  	add_column :banners, :position, :integer, :unique=> true
  end
end
