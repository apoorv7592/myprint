module Spree
	class TrimsController < Spree::HomeController

		def show
            @trims = Trim.retrieve_trims
			@trm = Trim.find(params[:id])
			
			
			
		end
	end
end