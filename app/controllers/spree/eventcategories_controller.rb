module Spree
	class EventcategoriesController < Spree::HomeController

		def show
            #@categories = Category.retrieve_categories
			@ecat = Eventcategory.find(params[:id])
			#@escat = @ecat.sub_categories
		end

		def index
				@ecats = Eventcategory.all
		end
    end
end