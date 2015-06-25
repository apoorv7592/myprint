Spree::Product.class_eval do
	require 'csv'
	require 'roo'
	acts_as_taggable
	acts_as_commentable
	
    belongs_to :suite
	belongs_to :designer
	has_many :properties
    has_many :likes
    
    has_many :product_discovers, foreign_key: "spree_product_id"
    has_many :discovers, through: :product_discovers

	searchable do 
        text :name, :description, :tag_list
        time :created_at
        #integer :like_no
        integer :avg_rating
        
        text :designer_names do 
            designer.name
        end
        
        text :discover do 
            discovers.name
        end
        
        #integer :sub_category_ids, multiple: true, references: SubCategory
        integer :designer_id, multiple:true, references: Designer
    end

	has_many :prodinfos
	has_one :similarprod
	
	has_many :reviews


	  def is_not_sample?
	    self.name != 'sample'
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

	  def self.import(file)
        spreadsheet = open_spreadsheet(file)
        header = spreadsheet.row(1) 

        (2..spreadsheet.last_row).each do |i|
        	c = Spree::Product.new
        	c.name = spreadsheet.cell(i,1)
	         c.description = spreadsheet.cell(i,2)
	         c.available_on = spreadsheet.cell(i,3)
	         c.slug = spreadsheet.cell(i,4)
	         c.meta_keywords = spreadsheet.cell(i,5)
	         c.meta_title = spreadsheet.cell(i,6)
	         c.price = spreadsheet.cell(i,7)
	         c.shipping_category_id = spreadsheet.cell(i,8)
	         c.designer_id = spreadsheet.cell(i,9)
	         
	         discover_string = spreadsheet.cell(i,10)
	         discover_ids = discover_string.split(',')
	         c.save!
	         discover_ids.each do |d|
	            dis = Discover.where(name: d).first
	            if dis
	                c.discovers<<dis
	            end
	         end
	         
	         c.overview = spreadsheet.cell(i,11)
	         c.cod = spreadsheet.cell(i,12)
	         c.delivery_time = spreadsheet.cell(i,13)
	         c.pin = spreadsheet.cell(i,14)
	         c.save!
        end
      end

      def self.open_spreadsheet(file)
  		case File.extname(file.original_filename)
	  		when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
	  		when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore )
	  		when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore )
	  		when ".ods" then Roo::OpenOffice.new(file.path, file_warning: :ignore)
	  		else raise "Unknown file type: #{file.original_filename}"
  	  	end
	  end

end