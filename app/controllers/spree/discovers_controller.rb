module Spree
	class DiscoversController < Spree::HomeController
		

		def index
			@discovers = Discover.all
		end
		
		def show
			@discover = Discover.find(params[:id])
		end
    end
end