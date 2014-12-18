class AddPictureToBanners < ActiveRecord::Migration
  def self.up
    add_attachment :banners, :picture
  end

  def self.down
    remove_attachment :banners, :picture
  end
end
