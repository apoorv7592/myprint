module Spree
	module Api
		module V1
			class ProductsController < Spree::HomeController
				respond_to :json
				
				def modal_info
					@result = Spree::Product.friendly.find(params[:id])
					respond_to do |format|
						format.json
					end
				end

				def search_prod
					@result = Spree::Product.friendly.find(params[:id])
					respond_to do |format|
						format.json
					end
				end
			end
		end
	end
end