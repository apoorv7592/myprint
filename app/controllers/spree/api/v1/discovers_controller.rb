module Spree
	module Api
		module V1
			class DiscoversController < Spree::HomeController
				respond_to :json
				
				def show
					if params[:page].present?
						page = params[:page].to_i 
					else
						page = 1
					end
					per_page = 2
					@discover = Discover.friendly.find(params[:id])
					@products = @discover.spree_products
					@results = @products[(page-1)*per_page...(page*per_page)]
					respond_to do |format|
						format.json 
					end
				end
			end
		end
	end
end