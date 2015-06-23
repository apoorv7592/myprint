# == Schema Information
#
# Table name: discovers
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  slug                :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  category_id         :integer
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Discover < ActiveRecord::Base
    extend FriendlyId
	friendly_id :name, use: [:slugged, :history]
	
    belongs_to :category
    
    has_many :discoverfollows, foreign_key: "discover_id"
	has_many :users, class_name: 'Spree::User', :through => :discoverfollows
	
	has_many :product_discovers
	has_many :spree_products, class_name: 'Spree::Product', through: :product_discovers

	has_attached_file :avatar, styles: {
	    thumb: '100x100>',
	    square: '200x200#',
	    medium: '300x300>'
	}
	
	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	has_many :stories, as: :object
	searchable do 
        text :name
    end
end
