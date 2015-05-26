Spree::Product.class_eval do
	acts_as_taggable

    belongs_to :suite
	belongs_to :designer
	has_many :properties
    belongs_to :discover

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



	def is_not_sample?
		self.name != 'sample'
	end
end