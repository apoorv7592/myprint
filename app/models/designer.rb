# == Schema Information
#
# Table name: designers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  about      :text
#  active     :boolean
#  city       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Designer < ActiveRecord::Base
	has_many :suites
end
