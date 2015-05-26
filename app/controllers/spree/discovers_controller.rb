module Spree
	class DiscoversController < Spree::HomeController
		
	
		def index
			@discovers = Discover.all
		end
		
		def show
			@discover = Discover.find(params[:id])
		end

		def test
			@prd = Suite.friendly.find(params[:id])
			respond_to do |format|
        		format.json { render :json =>  @prd }
    		end
		end
    end
end