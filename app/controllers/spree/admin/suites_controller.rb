module Spree
	module Admin
		class SuitesController < Spree::Admin::BaseController
			def index
				@suites = Suite.all
			end

			def show
				@suite = Suite.where(id: params[:id]).first	
			end

			def new
				@suite = Suite.new
			end
			def create
				@s = Suite.new(suites_params)
				if @s.save
					respond_to do |format|
						format.html {redirect_to controller: 'suites', action:'index'}
						format.js {@msg = 'Suite Saved successfully'}
					end
				else
					respond_to do |format|
						format.html {redirect_to :back , notice: 'Some error occured'}
						format.js {@msg = 'Some error occured'}
					end
				end
			end

			def edit
				@suite = Suite.where(params[:id]).first
			end

			def update
				@s = Suite.where(params[:id]).first
				if @s.update(suites_params)
					respond_to do |format|
						format.html {redirect_to admin_suite_path(@s)}
					end
				else
					respond_to do |format|
						format.html {redirect_to :back , notice: 'Some error occured'}
					end
				end
			end

			def destroy
				@suite = Suite.where(id: params[:id]).first
				if @suite.destroy
					redirect_to admin_suites_path, message:'Suite deleted successfully'
				else
					redirect_to :back, message:'Some error occured'
				end
			end

			private
				def suites_params
					params.require(:suite).permit(:sku_id, :name, :description, :designer_id, :sub_category_id, :available_on)
				end 
		end
	end
end
			
