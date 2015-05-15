module Spree
	class DiscoverfollowsController < Spree::HomeController
		#before_action :logged_in_user
		def create
		    #user = Spree::User.find(params[:user_id])
		    discover = Discover.find(params[:discover_id])
		    spree_current_user.pin(discover)
		    respond_to do |format|
		    	
		    	format.html {redirect_to :back}
		    	format.js

		    end
  		end

  		def destroy
    		user = Discoverfollow.find(params[:id]).discover
    		spree_current_user.unpin(user)
    		respond_to do |format|
		    	format.html {redirect_to :back}
		    	format.js
		    end
  		end
	end
end