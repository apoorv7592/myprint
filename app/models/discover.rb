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
    has_many :discoverfollows
	has_many :users, class_name: 'Spree::User', :through => :discoverfollows
end
