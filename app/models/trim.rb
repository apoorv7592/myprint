# == Schema Information
#
# Table name: trims
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Trim < ActiveRecord::Base
	has_and_belongs_to_many :suites
	
end
