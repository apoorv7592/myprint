module Spree
	class DesignersController < Spree::HomeController
		before_action :authenticate_designer, only: [:dashboard, :new, :create]

		def new
		end

		def index
			@designers = Designer.active
		end

		def show	
			@dsg = Designer.friendly.find(params[:id])
			@usr = @dsg.user
			if @usr.is_designer?
				if  @usr.designer.active
					@designer = @usr
					@details = @designer.designer 
				else
					redirect_to controller: :back, error: 'This designer is not active'
				end
			else
				redirect_to controller: 'home', action: 'index', notice:'This user is not registered as a designer'
			end
		end

		def create 
			@d = Designer.new(designer_params)
			if @d.save
				@d.user_id = spree_current_user.id
				@d.save
				redirect_to action:'dashboard'
			else
				redirect_to :back, message: 'Some error occured'
			end
		end

		def dashboard
			@designer = spree_current_user
		end

		def complete_account
			if spree_current_user.designer.present?
				@dsg = spree_current_user.designer
			else
				@dsg = Designer.new
			end			
		end

		private
			def authenticate_designer
				if spree_current_user && !spree_current_user.is_designer
					redirect_to :back, notice: 'This user
					is not registered as a designer'
				end
			end
			
			def designer_params
				params.require(:designer).permit(:name, :city, :about, :phonenum, :college, :avatar)
			end
	end
end
