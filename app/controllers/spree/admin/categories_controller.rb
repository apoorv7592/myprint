module Spree
	module Admin
		class CategoriesController < Spree::Admin::BaseController
			
			def index
				@cats = Category.all
			end
			
			def new
				@cat = Category.new
			end
			
			def create
				@s = Category.new(cats_params)
				if @s.save
					respond_to do |format|
						format.html {redirect_to action:'index'}
						format.js {@msg = 'Category Saved successfully'}
					end
				else
					respond_to do |format|
						format.html {redirect_to :back , notice: 'Some error occured'}
						format.js {@msg = 'Some error occured'}
					end
				end
			end
			
			def show
				@cat = Category.friendly.find(params[:id])
			end

			def edit
				@cat = Category.friendly.find(params[:id])
			end

			def update
				@s = Category.friendly.find(params[:id])

				if @s.update(cats_params)
					respond_to do |format|
						format.html {redirect_to admin_category_path(@s)}
					end
				else
					respond_to do |format|
						format.html {redirect_to :back , notice: 'Some error occured'}
					end
				end
			end

			def destroy
				@cat = Category.friendly.find(params[:id])
				if @cat.destroy
					redirect_to admin_categories_path, message:'Suite deleted successfully'
				else
					redirect_to :back, message:'Some error occured'
				end
			end
			private
				def cats_params
					params.require(:category).permit(:name)

				end

		end
	end
end