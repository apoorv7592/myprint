class Color < ActiveRecord::Base
	has_and_belongs_to_many :suites


    def self.retrieve_colors
		Color.all
	end
end
	