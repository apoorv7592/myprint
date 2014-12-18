module Spree
	module Admin
		class BannersController < Spree::Admin::BaseController
			
			def index
				@banners = Banner.all
				@new_banner = Banner.new
			end

			def create
				if @new_banner = Banner.create(banner_params)
					flash[:success] = "Banner succssfully stored"
				else
					flash[:error] = "Some error occured"
				end
				redirect_to :back
			end


			private
				def banner_params
					params.require(:banner).permit(:category, :position,
						:picture_file_name, :picture_content_type,
						:picture_file_size,:picture_updated_at)
				end
			
		end
	end
end