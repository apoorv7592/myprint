class Variant < ActiveRecord::Base
	 has_many :suites, :through => :characteristics
	 belongs_to :characteristic

	def self.retrieve_variants
        Variant.all
    end	
end
