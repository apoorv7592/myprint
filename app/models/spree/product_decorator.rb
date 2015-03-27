Spree::Product.class_eval do
	belongs_to :suite

	def is_not_sample?
		self.name != 'sample'
	end
end