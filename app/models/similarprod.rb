# == Schema Information
#
# Table name: similarprods
#
#  id           :integer          not null, primary key
#  product_name :string(255)
#  product_id   :integer
#  prod1        :integer
#  prod2        :integer
#  prod3        :integer
#  prod4        :integer
#  prod5        :integer
#  prod6        :integer
#  prod7        :integer
#  prod8        :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Similarprod < ActiveRecord::Base
	belongs_to :spree_products, :class_name => 'Spree::Product'
      def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
        	Similarprod.create! row.to_hash
        end
      end
end
