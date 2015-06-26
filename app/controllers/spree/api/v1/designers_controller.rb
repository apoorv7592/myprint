module Spree
	module Api
		module V1
			class DesignersController < Spree::HomeController
				respond_to :json
				
				def des_prod
					per_page = ENV['PER_PAGE'].to_i
					
					if params[:page].present?
						page = params[:page].to_i 
					else
						page = 1
					end
					@designer = Designer.find(params[:id])
					@products = @designer.spree_products
					@results = @products[(page-1)*per_page...(page*per_page)]
					respond_to do |format|
						format.json 
					end
				end
			end
		end
	end
end