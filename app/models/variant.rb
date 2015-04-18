# == Schema Information
#
# Table name: variants
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#  colorcode  :string(255)
#

class Variant < ActiveRecord::Base
	 has_many :suites, :through => :characteristics
	 belongs_to :characteristic

	def self.retrieve_variants
        Variant.all
    end	
end
