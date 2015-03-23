# == Schema Information
#
# Table name: sub_categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  slug        :string(255)
#

class SubCategory < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: [:slugged, :history]
	
	belongs_to :category
	has_many :suites
	

	def self.retrieve_sub_categories
		SubCategory.all
	end

	private
		def should_generate_new_friendly_id?
			slug.blank? || name_changed?
		end
end
