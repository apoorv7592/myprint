# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#  ancestry   :string(255)
#

class Category < ActiveRecord::Base
	
	extend FriendlyId
	friendly_id :name, use: [:slugged, :history]

	has_many :sub_categories
	has_ancestry
	
	has_many :discovers

	def self.retrieve_categories
		Category.all
	end
	
	def give_sub_cats(cat_id)
    	c= Category.find(cat_id)
    	sc = c.sub_categories
	end

	private
		def should_generate_new_friendly_id?
			slug.blank? || name_changed?
		end
end
