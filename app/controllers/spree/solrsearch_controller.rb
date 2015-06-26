module Spree
	class SolrsearchController < Spree::HomeController

		def index
			@searcher = Spree::Config.searcher_class.new(params[:q])
			@products = @searcher.retrieve_products
			
		    @search= Sunspot.search(Discover) do
		    	fulltext params[:q]
		    end
		    @discovers = @search.results
		end
	end
end