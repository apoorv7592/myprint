# == Schema Information
#
# Table name: product_discovers
#
#  id          :integer          not null, primary key
#  product_id  :integer          default(0), not null
#  discover_id :integer          default(0), not null
#  created_at  :datetime
#  updated_at  :datetime
#

class ProductDiscover < ActiveRecord::Base
	belongs_to :spree_product
	belongs_to :discover


	validates :spree_product_id, presence: true
	validates :discover_id, presence: true
end
