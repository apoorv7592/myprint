Spree::Product.class_eval do
	belongs_to :suite
	belongs_to :designer
	has_many :properties

	searchable do 
        text :name, :description
        time :created_at
        integer :like_no
        integer :avg_rating
        
        text :designer_names do 
            designer.name
        end
        
        #integer :sub_category_ids, multiple: true, references: SubCategory
        integer :designer_id, multiple:true, references: Designer
    end



	def is_not_sample?
		self.name != 'sample'
	end
end