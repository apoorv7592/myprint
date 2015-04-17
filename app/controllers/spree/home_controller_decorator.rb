module HomeControllerExtensions
	def index
			@designers = Designer.find(9)
			@lead = Lead.new
	end
end

Spree::HomeController.class_eval do
  prepend HomeControllerExtensions
end

