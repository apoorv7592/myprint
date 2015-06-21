module HomeControllerExtensions
	def index
			@designers = Designer.find(1)
			@lead = Lead.new
			@discover = Discover.first
	end
end

Spree::HomeController.class_eval do
  prepend HomeControllerExtensions
end

