module Spree
	module Api
		module V1
			class CategoriesController < Spree::HomeController
				respond_to :json
				
				def show
					@category = Category.friendly.find(params[:id])

					if params[:page].present?
						page = params[:page].to_i 
					else
						page = 1
					end
					per_page = 2
					@discovers = @category.discovers
					arr= Array.new
					
					@discovers.each do |d|
						prds = d.spree_products.limit(10).order("RANDOM()")
						prds.each do |p|
							arr<<p
						end
					end
					
					@results = arr
					respond_to do |format|
						format.json 
					end
				end

				def get_discovers
					@category = Category.friendly.find(params[:id])
					@discovers = @category.discovers[0...8]
					respond_to do |format|
						format.json 
					end
				end
			end
		end
	end
end
