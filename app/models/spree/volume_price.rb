# == Schema Information
#
# Table name: spree_volume_prices
#
#  id            :integer          not null, primary key
#  variant_id    :integer
#  name          :string(255)
#  range         :string(255)
#  amount        :decimal(8, 2)
#  position      :integer
#  created_at    :datetime
#  updated_at    :datetime
#  discount_type :string(255)
#

class Spree::VolumePrice < ActiveRecord::Base
	belongs_to :variant, :touch => true
	acts_as_list :scope => :variant
	validates :amount, :presence => true
	validates :discount_type, :presence => true, :inclusion => {:in => %w(price dollar percent), :message => "%{value} is not a valid Volume Price Type"}
	validates :range, :format => {:with => /\(?[0-9]+(?:\.{2,3}[0-9]+|\+\)?)/, :message => "must be in one of the following formats: (a..b), (a...b), (a+)"}
	validates :variant, :presence => true
	OPEN_ENDED = /\(?[0-9]+\+\)?/

	def include?(quantity)
		if open_ended?
			bound = /\d+/.match(range)[0].to_i
			return quantity >= bound
		else
			to_rng(range) === quantity
		end
	end

	# indicates whether or not the range is a true Ruby range or an open ended range with no upper bound
	def open_ended?
		OPEN_ENDED =~ range
	end
	def to_rng(x)
		case x.count('.')
	         when 2
	             elements = x.split('..')
	             return Range.new(elements[0].to_i, elements[1].to_i)
	         when 3
	             elements = x.split('...')
	             return Range.new(elements[0].to_i, elements[1].to_i-1)
	         else
	             raise ArgumentError.new("Couldn't convert to Range:#{str}")
    	end
	end
end
