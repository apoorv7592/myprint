module Spree
	class CategoriesController < Spree::HomeController
		def show
			@cat = Category.find(params[:id])
		end
	end
end