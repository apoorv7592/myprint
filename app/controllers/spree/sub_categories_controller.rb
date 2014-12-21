module Spree
	class SubCategoriesController < Spree::HomeController
		def show
		 @sub_categories = SubCategory.retrieve_sub_categories
			@subcat = SubCategory.find(params[:id])
		    @scsuite = @subcat.suites
		
		end
	end
end