Spree::Product.class_eval do
	belongs_to :suite
	belongs_to :designer

	def is_not_sample?
		self.name != 'sample'
	end
end