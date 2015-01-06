module Spree
	class SubCategoriesController < Spree::HomeController
		def show
			@subcat = SubCategory.find(params[:id])
			@search = Suite.search do 
		    	fulltext params[:search]
		    	with(:available_on).less_than(Time.zone.now)
		    end
		    @scsuite = @search.results
		end
	end
end