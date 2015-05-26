# == Schema Information
#
# Table name: ratings
#
#  id          :integer          not null, primary key
#  stars       :integer          default(0)
#  product_id  :integer
#  user_id     :integer
#  designer_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Rating < ActiveRecord::Base
  belongs_to :spree_products, :class_name => 'Spree::Product'
  belongs_to :spree_users, :class_name => 'Spree::User'
end
