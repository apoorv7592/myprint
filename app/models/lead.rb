# == Schema Information
#
# Table name: leads
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  contact    :string(255)
#  city       :string(255)
#  gender     :string(255)
#  product_id :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Lead < ActiveRecord::Base
  validates :name, length: { minimum: 2 }
  validates :email, length: { maximum: 500 }
  validates :contact, length: { in: 10..12 }
  validates :city, length: { minimum: 2}

end
