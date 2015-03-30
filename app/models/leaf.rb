# == Schema Information
#
# Table name: leafs
#
#  id            :integer          not null, primary key
#  venue         :text
#  date_of_event :date
#  time_of_event :time
#  created_at    :datetime
#  updated_at    :datetime
#  name          :string(255)
#

class Leaf < ActiveRecord::Base
	belongs_to :cust
end
