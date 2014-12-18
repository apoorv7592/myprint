module Spree
	class ColorsController < Spree::HomeController

		def show
            @colors = Color.retrieve_colors
			@col = Color.find(params[:id])
			
			
			
		end
	end
end