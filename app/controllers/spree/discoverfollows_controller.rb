module Spree
	class DiscoverfollowsController < Spree::HomeController
		#before_action :logged_in_user
		def create
		    #user = Spree::User.find(params[:user_id])
		    discover = Discover.find(params[:discover_id])
		    spree_current_user.follow_discover(discover)
		    respond_to do |format|
		    	
		    	format.html {redirect_to :back}
		    	format.js {@discover = discover}

		    end
  		end

  		def destroy
    		discover = Discover.find(params[:discover_id])
    		spree_current_user.unfollow_discover(discover)
    		respond_to do |format|
		    	format.html {redirect_to :back}
		    	format.js {@discover = discover}
		    end
  		end
	end
end