class Spree::WishedProduct < ActiveRecord::Base
	belongs_to :suite
	belongs_to :wishlist
end