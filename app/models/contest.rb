# == Schema Information
#
# Table name: contests
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  start_date  :datetime
#  end_date    :datetime
#  active      :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Contest < ActiveRecord::Base
	has_many :entries, dependent: :destroy
end
