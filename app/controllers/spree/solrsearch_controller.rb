module Spree
	class SolrsearchController < Spree::HomeController

		def index
			@search = Sunspot.search(Spree::Product) do 
		    	fulltext params[:search]
		    	
               paginate :page => params[:page], :per_page => 8

		    	#dynamic(:color_ids) do
		    	#	facet(:color_names)
		    	#end
		    end
		    @suites = @search.results
		end

		
	end
end