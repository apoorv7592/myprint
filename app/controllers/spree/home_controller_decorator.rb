module HomeControllerExtensions
	def index
			@designers = Designer.find(1)
	end
end

Spree::HomeController.class_eval do
  prepend HomeControllerExtensions
end

