module HomeControllerExtensions
	def index
		@searcher = build_searcher(params.merge(include_images: true))
		@products = @searcher.retrieve_products
		@suites = @searcher.retrieve_suites
		@taxonomies = Spree::Taxonomy.includes(root: :children)
	end
end

Spree::HomeController.class_eval do
  prepend HomeControllerExtensions
end