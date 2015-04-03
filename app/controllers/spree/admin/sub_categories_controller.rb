module Spree
	module Admin
		class SubCategoriesController < Spree::Admin::BaseController
			
			def index
				@cats = SubCategory.all
			end
			
			def new
				@cat = SubCategory.new
			end
			
			def create
				@s = SubCategory.new(cats_params)
				if @s.save
					respond_to do |format|
						format.html {redirect_to action:'index'}
						format.js {@msg = 'SubCategory Saved successfully'}
					end
				else
					respond_to do |format|
						format.html {redirect_to :back , notice: 'Some error occured'}
						format.js {@msg = 'Some error occured'}
					end
				end
			end
			
			def show
				@cat = SubCategory.friendly.find(params[:id])
			end

			def edit
				@cat = SubCategory.friendly.find(params[:id])
			end

			def update
				@s = SubCategory.friendly.find(params[:id])

				if @s.update(cats_params)
					respond_to do |format|
						format.html {redirect_to admin_sub_category_path(@s)}
					end
				else
					respond_to do |format|
						format.html {redirect_to :back , notice: 'Some error occured'}
					end
				end
			end

			def destroy
				@cat = SubCategory.friendly.find(params[:id])
				if @cat.destroy
					redirect_to admin_sub_categories_path, message:'Suite deleted successfully'
				else
					redirect_to :back, message:'Some error occured'
				end
			end
			private
				def cats_params
					params.require(:sub_category).permit(:name)

				end

		end
	end
end