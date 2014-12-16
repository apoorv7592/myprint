# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
	has_many :sub_categories

	

	def self.retrieve_categories
		Category.all
	end
	
	def give_sub_cats(cat_id)
    	c= Category.find(cat_id)
    	sc = c.sub_categories
	end
end
