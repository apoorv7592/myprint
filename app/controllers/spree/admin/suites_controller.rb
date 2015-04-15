module Spree
	module Admin
		class SuitesController < Spree::Admin::BaseController
			def index
				@suites = Suite.all
			end

			def show

				@suite = Suite.friendly.find(params[:id])

			end

			def new
				@suite = Suite.new
			end
			def create
				@s = Suite.new(suites_params)
				scats = params['sub_category_ids']
				colors = params['colors']

				if !colors.nil?
					@s.assign_colors(colors)
				end

				if !scats.nil?
					@s.assign_subcats(scats)
				end

				if @s.save
					respond_to do |format|
						format.html {redirect_to action:'index'}
						format.js {@msg = 'Suite Saved successfully'}
					end
				else
					respond_to do |format|
						format.html {redirect_to :back , notice: @s.errors.full_messages.first}
						format.js {@msg = 'Some error occured'}
					end
				end
			end

			def edit

				@suite = Suite.friendly.find(params[:id])
			end


			def update
				@s = Suite.friendly.find(params[:id])
				scats = params['sub_category_ids']
				colors = params['colors']

				if !colors.nil?
					@s.assign_colors(colors)
				end

				if !scats.nil?
					@s.assign_subcats(scats)
				end

				if @s.update(suites_params)
					respond_to do |format|
						format.html {redirect_to admin_suite_path(@s)}
					end
				else
					respond_to do |format|
						format.html {redirect_to :back , notice: @s.errors.full_messages.first}
					end
				end
			end

			def destroy
				@suite = Suite.friendly.find(params[:id])
				if @suite.destroy
					redirect_to admin_suites_path, message:'Suite deleted successfully'
				else
					redirect_to :back, message:'Some error occured'
				end
			end

			def variants
				@variants = Variant.all
			end

			private
				def suites_params
					params.require(:suite).permit(:sku_id, :name, :description, :designer_id, :sub_category_id, :available_on, :slug, :position, :avatar)

				end 
				
		end
	end
end
			
