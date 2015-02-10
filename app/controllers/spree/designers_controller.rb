module Spree
	class DesignersController < Spree::HomeController
		def index
			@designers = Designer.all
		end

		def show
			@usr = Spree::User.find(params[:id])
			if @usr.is_designer?
				@designer = @usr
				@details = @designer.designer
			else
				redirect_to controller: 'home', action: 'index', notice:'This user is not registered as a designer'
			end
		end
	end
end
