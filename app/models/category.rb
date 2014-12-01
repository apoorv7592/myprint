class Category < ActiveRecord::Base
	has_many :sub_categories

	def give_sub_cats(cat_id)
    	c= Category.find(cat_id)
    	sc = c.sub_categories
	end
end
