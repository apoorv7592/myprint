module Spree
	module Admin
		class DiscoversController < Spree::Admin::BaseController
			def index
				@discovers = Discover.all
			end
			
			def new
				@disc = Discover.new
			end
			
			def create
				@disc = Discover.new(disc_params)
				if @disc.save
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
				@disc = Discover.friendly.find(params[:id])
			end

			def edit
				@disc = Discover.friendly.find(params[:id])
			end

			def update
				@disc = Discover.friendly.find(params[:id])

				if @disc.update(disc_params)
					respond_to do |format|
						format.html {redirect_to admin_discover_path(@disc)}
					end
				else
					respond_to do |format|
						format.html {redirect_to :back , notice: 'Some error occured'}
					end
				end
			end

			def destroy
				@disc = Discover.friendly.find(params[:id])
				if @disc.destroy
					redirect_to admin_discovers_path, message:'Suite deleted successfully'
				else
					redirect_to :back, message:'Some error occured'
				end
			end
			private
				def disc_params
					params.require(:discover).permit(:name, :category_id, :avatar)

				end
		end
	end
end
			