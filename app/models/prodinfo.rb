# == Schema Information
#
# Table name: prodinfos
#
#  id           :integer          not null, primary key
#  length       :float
#  width        :float
#  height       :float
#  size         :string(255)
#  material     :string(255)
#  instructions :string(255)
#  product_id   :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Prodinfo < ActiveRecord::Base
	belongs_to :spree_products, :class_name => 'Spree::Product'
end
