# == Schema Information
#
# Table name: discoverfollows
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  discover_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Discoverfollow < ActiveRecord::Base
	belongs_to :spree_user
	belongs_to :discover

	validates :user_id, presence: true
	validates :discover_id, presence: true
end
