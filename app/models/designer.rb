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
#  user_id    :integer          default(0), not null
#

class Designer < ActiveRecord::Base
	has_many :suites
	has_many :entries, dependent: :destroy
	belongs_to :user
end
