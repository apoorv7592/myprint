# == Schema Information
#
# Table name: suites
#
#  id              :integer          not null, primary key
#  sku_id          :string(255)
#  name            :string(255)
#  description     :text
#  designer_id     :integer
#  sub_category_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#  available_on    :date
#

class Suite < ActiveRecord::Base
	belongs_to :sub_category
	belongs_to :designer
	has_and_belongs_to_many :colors
	has_and_belongs_to_many :trims
	has_and_belongs_to_many :papers
	has_and_belongs_to_many :dimensions
	has_many :spree_products, :class_name => 'Spree::Product'

	searchable do 
		text :name, :description
		time :available_on
		
		text :designer_names do 
			designer.name
		end

		integer :designer_id, multiple:true, references: Designer
		integer :color_ids, multiple:true, references: Color
		integer :trim_ids, multiple:true, references: Trim
		integer :dimension_ids, multiple:true, references: Dimension
	end

	def self.retrieve_suites
        Suite.all
    end	
    
    def self.match_(id)
    	
    end

	scope :active, ->  { where( "available_on < ? " , Date.today)}
end

