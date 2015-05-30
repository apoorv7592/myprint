Spree::Product.class_eval do
	acts_as_taggable

    belongs_to :suite
	belongs_to :designer
	has_many :properties
    belongs_to :discover
    has_many :likes
    
	searchable do 
        text :name, :description, :tag_list
        time :created_at
        integer :like_no
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
end