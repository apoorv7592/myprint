module Spree
	class DesignersController < Spree::HomeController
		before_action :authenticate_designer, only: [:dashboard]

		def index
			@designers = Designer.active
		end

		def show	
			@usr = Spree::User.find(params[:id])
			if @usr.is_designer?
				if @usr.designer.active
					@designer = @usr
					@details = @designer.designer 
				else
					redirect_to controller: :back, error: 'This designer is not active'
				end
			else
				redirect_to controller: 'home', action: 'index', notice:'This user is not registered as a designer'
			end
		end

		def dashboard
			@designer = spree_current_user
		end

		private
			def authenticate_designer
				if !spree_current_user.is_designer
					redirect_to :back, notice: 'This user
					is not registered as a designer'
				end
			end
	end
end
