module Spree
	module Admin
		class ColorsController < Spree::Admin::BaseController
			
			def index
				@colors = Color.all
			end

			def new
				@color = Color.new
			end

			def edit
				@color = Color.find(params[:id])
			end

			def show
				@color = Color.find(params[:id])
			end

			def create
				@s = Color.new(colors_params)
				if @s.save
					respond_to do |format|
						format.html {redirect_to action:'index'}
						format.js {@msg = 'Color Saved successfully'}
					end
				else
					respond_to do |format|
						format.html {redirect_to :back , notice: @s.errors.full_messages}
						format.js {@msg = @s.errors.full_messages}
					end
				end
			end

 			def update
				@s = Color.find(params[:id])
				if @s.update(colors_params)
					respond_to do |format|
						format.html {redirect_to admin_color_path(@s)}
					end
				else
					respond_to do |format|
						format.html {redirect_to :back , notice: @s.errors.full_messages}
					end
				end
			end

			private
				def colors_params
					params.require(:color).permit(:name, :code)
				end
		end
	end
end
			