Spree::Product.class_eval do
	require 'csv'
	acts_as_taggable

    belongs_to :suite
	belongs_to :designer
	has_many :properties
    belongs_to :discover

	searchable do 
        text :name, :description, :tag_list
        time :created_at
        #integer :like_no
        integer :avg_rating
        
        text :designer_names do 
            designer.name
        end
        
        text :discover do 
            discover.name
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
        CSV.foreach(file.path, headers: true) do |row|
		   c = Spree::Product.new
		     c.name = row[0]
		     c.description = row[1]
		     c.available_on = row[2]
		     c.slug = row[3]
		     c.meta_keywords = row[4]
		     c.meta_title = row[5]
		     c.price = row[6]
		     c.shipping_category_id = row[7]
		     c.designer_id = row[12]
		     c.discover_id = row[14]
		     c.suite_id = row[15]

		   c.prodinfos.build(:length => row[8], :height => row[10],:instructions => row[11], :material => row[12], :product_id => row[13])
		   c.save
		#loc = c.locations.first
		#loc.pastors.build(:firstname => row[1])
		#loc.save
        end
      end

end