module Spree
	module Admin
		class BannersController < Spree::Admin::BaseController
			
			def index
				@banners = Banner.all
				@new_banner = Banner.new
			end

			def create
				if @new_banner = Banner.create(banner_params)
					flash[:success] = "Banner successfully stored"
				else
					flash[:error] = "Some error occured"
				end
				redirect_to :back
			end

			def edit
				@bn = Banner.find(params[:id])
			end

			def update
				@bn = Banner.find(params[:id])
				if @bn.update_attributes(banner_params)
					flash[:success] = "Banner successfully updated"
				else
					flash[:error] = "Some error occured"
				end
				redirect_to action: 'index'
			end

			def destroy
				@bn = Banner.find(params[:id])
				if @bn.destroy
					flash[:success] = "Banner successfully deleted"
				else
					flash[:error] = "Some error occured"
				end
				redirect_to action:'index'
			end

			private
				def banner_params
					params.require(:banner).permit(:category, :position, :picture)
				end
			
		end
	end
end