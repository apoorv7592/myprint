# == Schema Information
#
# Table name: sub_categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class SubCategory < ActiveRecord::Base
	belongs_to :category
	has_many :suites
	

	def self.retrieve_sub_categories
		SubCategory.all
	end
end
