# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  product_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Like < ActiveRecord::Base
	belongs_to :spree_user
	belongs_to :spree_product, :class_name => 'Spree::Product'
end
