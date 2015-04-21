module Spree
	module Admin
		class DesignersController < Spree::Admin::BaseController
			
			def index
				@designers = Designer.active
			end

			def new
				@dsg = Designer.new
			end

			def create
				@dsg = Designer.new(designer_params)
				if @dsg.save

					render action: 'show' 
				else
					redirect_to :back, error: 'Some error occured'
				end
			end
			
			def edit 
				@dsg = Designer.where(params[:designer_id]).first
			end

			def update
				@dsg = Designer.find(params[:id])
				if @dsg.update(designer_params)
					render action: 'show' 
				else
					redirect_to :back, error: 'Some error occured'
				end
			end

			def show
				@dsg = Designer.where(params[:designer_id]).first
			end

			def activate
				@dsg = Designer.where(id: params[:designer_id]).first
				@dsg.active = true
				if @dsg.save
					respond_to do |format|
						format.html {redirect_to :back, message: 'activated'}
						format.js 
					end
				else
					respond_to do |format|
						format.html {redirect_to :back, message: 'some error occured'}
						format.js 
					end
				end
			end

			def deactivate
				@dsg = Designer.where(id: params[:designer_id]).first
				@dsg.active = false
				if @dsg.save
					respond_to do |format|
						format.html {redirect_to :back, message: 'Deactivated'}
						format.js 
					end
				else
					respond_to do |format|
						format.html {redirect_to :back, message: 'some error occured'}
						format.js 
					end
				end
			end

			private
				def designer_params
					params.require(:designer).permit(:name, :about, :city, :active, :avatar)
				end
		end
	end
end