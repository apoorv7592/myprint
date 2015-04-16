# == Schema Information
#
# Table name: suites
#
#  id                  :integer          not null, primary key
#  sku_id              :string(255)
#  name                :string(255)
#  description         :text
#  designer_id         :integer
#  sub_category_id     :integer
#  created_at          :datetime
#  updated_at          :datetime
#  available_on        :date
#  avg_rating          :decimal(7, 5)    default(0.0), not null
#  reviews_count       :integer          default(0), not null
#  like_no             :integer          default(0)
#  slug                :string(255)
#  position            :integer
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  variant             :string(255)
#  characteristic      :string(255)
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
    medium: '238x238>',
    large:  '500x500>'
    }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/  # Validate the attached image is image/jpg, image/png, etc	
		
		
    has_many :suite_images, dependent: :destroy	
	belongs_to :designer
	has_and_belongs_to_many :colors
	has_and_belongs_to_many :trims
	has_and_belongs_to_many :papers
	has_and_belongs_to_many :dimensions
	has_and_belongs_to_many :sub_categories

	has_many :spree_products, :class_name => 'Spree::Product'
	has_many :reviews,:class_name=> 'Spree::Review'
	has_many :wished_products, :class_name=> 'Spree::WishedProduct', dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :custs

	validates_presence_of :name, message: 'Name cannot be blank'
	validates_presence_of :sku_id, message: 'SKU ID cannot be blank'
	#validates_presence_of :sub_category_id, message: 'Sub category ID cannot be blank'
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
        integer :category_name, multiple: true do 
          sub_categories.map{|s| s.category.name}
        end
        integer :sub_category_ids, multiple: true, references: SubCategory
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


def self.search(q,sub_cat_id,designer_id, color_id, trim_id,dimension_id, created_at,like_no,avg_rating,price, category_name, page )
        @search = Sunspot.search(Suite) do 
                fulltext q
                with(:available_on).less_than(Time.zone.now)
                with(:sub_category_ids, sub_cat_id) if sub_cat_id.present?
                with(:category_name, category_name) if category_name.present?

                designer_filter = with(:designer_id, designer_id) if designer_id.present?
                color_filter = with(:color_ids, color_id) if color_id.present?
                trim_filter = with(:trim_ids, trim_id) if trim_id.present?                
                dimension_filter = with(:dimension_ids, dimension_id) if dimension_id.present?                
                
                order_by(:position, :desc)
                order_by(:created_at, :desc) if created_at
                order_by(:like_no, :desc) if like_no
                order_by(:avg_rating, :desc) if avg_rating
                order_by(:price, :desc) if price
                
                facet :designer_id, exclude: [designer_filter, color_filter, trim_filter, dimension_filter].compact
                facet :color_ids, exclude: [designer_filter, color_filter, trim_filter, dimension_filter].compact
                facet :trim_ids, exclude: [designer_filter, color_filter, trim_filter, dimension_filter].compact
                facet :dimension_ids, exclude: [designer_filter, color_filter, trim_filter, dimension_filter].compact
                
                paginate :page => page, :per_page => 12

            end

    end

	
	def get_images
		self.suite_images
	end
    def assign_colors(clrs)
        self.colors.clear
        clrs.each do |c|
            clr = Color.where(id: c).first
            self.colors<<clr
        end
    end
    def assign_subcats(scats)
        self.sub_categories.clear
        scats.each do |s|
            scat = SubCategory.where(id: s).first
            self.sub_categories<<scat
        end
    end

	
	private
		
		def should_generate_new_friendly_id?
			slug.blank? || name_changed?
		end

end



