module Spree
	class SolrsearchController < Spree::HomeController

		def index
			
			@search = Sunspot.search(Spree::Product) do 
		    	fulltext params[:q]
                paginate :page => params[:page], :per_page => 8
		    end
		    @products = @search.results

		    @search= Sunspot.search(Discover) do
		    	fulltext params[:q]
		    end
		    @discovers = @search.results
		end
	end
end