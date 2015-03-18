# == Schema Information
#
# Table name: spree_wished_products
#
#  id          :integer          not null, primary key
#  suite_id    :integer
#  wishlist_id :integer
#  remark      :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Spree::WishedProduct < ActiveRecord::Base
	belongs_to :suite
	belongs_to :wishlist
end
