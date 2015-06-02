# == Schema Information
#
# Table name: discovers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  slug       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Discover < ActiveRecord::Base
    extend FriendlyId
	friendly_id :name, use: [:slugged, :history]
	
    has_many :discoverfollows
	has_many :users, class_name: 'Spree::User', :through => :discoverfollows
	has_many :spree_products, :class_name => 'Spree::Product', dependent: :destroy
end
