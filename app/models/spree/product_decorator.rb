Spree::Product.class_eval do
	belongs_to :suite
	has_many :properties

	def is_not_sample?
		self.name != 'sample'
	end
end