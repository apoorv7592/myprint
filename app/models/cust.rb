# == Schema Information
#
# Table name: custs
#
#  id             :integer          not null, primary key
#  gr_name        :string(255)
#  gr_father_name :string(255)
#  gr_mother_name :string(255)
#  gr_address     :text
#  br_name        :string(255)
#  br_father_name :string(255)
#  br_mother_name :string(255)
#  br_address     :text
#  user_id        :integer
#  suite_id       :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Cust < ActiveRecord::Base
	belongs_to :suite
	belongs_to :user

	has_many :leafs

	accepts_nested_attributes_for :leafs
end
