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
#  avg_rating      :decimal(7, 5)    default(0.0), not null
#  reviews_count   :integer          default(0), not null
#  like_no         :integer          default(0)
#  slug            :string(255)
#  position        :integer
#

class Suite < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: [:slugged, :history]
	##acts_as_list scope: :active


	#has_many :variants, :through => :characteristics
	#has_many :characteristics 

	has_attached_file :avatar,  styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large:  '500x500>'
    }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/  # Validate the attached image is image/jpg, image/png, etc	
		
		

	belongs_to :sub_category
	belongs_to :designer
	has_and_belongs_to_many :colors
	has_and_belongs_to_many :trims
	has_and_belongs_to_many :papers
	has_and_belongs_to_many :dimensions
	has_many :spree_products, :class_name => 'Spree::Product'
	has_many :reviews,:class_name=> 'Spree::Review'
	has_many :wished_products, dependent: :destroy
	has_many :likes, dependent: :destroy

	validates_presence_of :name, message: 'Name cannot be blank'
	validates_presence_of :sku_id, message: 'SKU ID cannot be blank'
	validates_presence_of :sub_category_id, message: 'Sub category ID cannot be blank'
	validates_presence_of :designer_id, message: 'Designer cannot be blank'
	validates_presence_of :available_on, message: 'Available on cannot be blank'

	scope :active, ->  { where( "available_on < ? " , Date.today)}
	
	searchable do 
		text :name, :description
		time :available_on
		time :created_at
		integer :like_no
		integer :avg_rating
		integer :position
		
		text :designer_names do 
			designer.name
		end

		integer :sub_category_id, references: SubCategory
		integer :designer_id, multiple:true, references: Designer
		integer :color_ids, multiple:true, references: Color
		integer :trim_ids, multiple:true, references: Trim
		integer :dimension_ids, multiple:true, references: Dimension
	end
	

	def self.retrieve_suites
        Suite.all.order('position ASC')
    end	
    
    def self.match_(id)
    	
    end

	def stars
		avg_rating.try(:round) || 0
	end

	def recalculate_rating
		self[:reviews_count] = reviews.reload.approved.count
		if reviews_count > 0
			self[:avg_rating] = reviews.approved.sum(:rating).to_f / reviews_count
		else
			self[:avg_rating] = 0
		end
		save
	end

	extend FriendlyId
	friendly_id :name, use: [:slugged, :history]

	private
		
		def should_generate_new_friendly_id?
			slug.blank? || name_changed?
		end

end

