# == Schema Information
#
# Table name: dimensions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  width      :float
#  height     :float
#  created_at :datetime
#  updated_at :datetime
#

class Dimension < ActiveRecord::Base
	has_and_belongs_to_many :suites
end
