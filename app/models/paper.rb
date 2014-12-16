# == Schema Information
#
# Table name: papers
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  weight      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Paper < ActiveRecord::Base
	has_and_belongs_to_many :suites
	
end
