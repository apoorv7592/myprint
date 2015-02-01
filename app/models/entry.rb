# == Schema Information
#
# Table name: entries
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  contest_id  :integer
#  description :text
#  title       :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Entry < ActiveRecord::Base
	belongs_to :spree_user
	belongs_to :contest
	has_many :entry_attachements, dependent: :destroy

	accepts_nested_attributes_for :entry_attachements, :reject_if => lambda { |t| t['image'].nil? }
 
end
