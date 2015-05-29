module Spree
	class CategoriesController < Spree::HomeController

		def show
            #@categories = Category.retrieve_categories
			@category = Category.friendly.find(params[:id])
		end
    end
end