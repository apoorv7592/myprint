module Spree
	class DiscoversController < Spree::HomeController
		
	
		def index
			@discovers = Discover.all
		end
		
		def show
			@discover = Discover.friendly.find(params[:id])
			@designer = User.first
		end

		def test
			@prd = Suite.friendly.find(params[:id])
			respond_to do |format|
        		format.json { render :json =>  @prd }
    		end
		end
    end
end