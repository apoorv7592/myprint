Spree::Product.class_eval do
	belongs_to :suite
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