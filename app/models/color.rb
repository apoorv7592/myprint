# == Schema Information
#
# Table name: colors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  code       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Color < ActiveRecord::Base
	has_and_belongs_to_many :suites


    def self.retrieve_colors
		Color.all
	end
end
	
