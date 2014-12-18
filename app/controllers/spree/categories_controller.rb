module Spree
	class CategoriesController < Spree::HomeController

		def show
            @categories = Category.retrieve_categories
			@cat = Category.find(params[:id])
			@scat = @cat.sub_categories
			
		end
			
		def retrieve_suites
                Suite.all
        end	
	
	end
end