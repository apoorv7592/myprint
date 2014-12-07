module Spree
	class CategoriesController < ApplicationController
		def show
			@cat = Category.find(params[:id])
		end
	end
end