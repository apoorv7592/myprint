module Spree
	module Admin
		class ProdinfosController < Spree::Admin::BaseController
			def index
				@prodinfos = Prodinfo.all
			end

			def new
				@prodinfo = Prodinfo.new
			end

			def edit
				@prodinfo = Prodinfo.find(params[:id])
			end

			def show
				@prodinfo = Prodinfo.find(params[:id])
			end

			def create
				@s = Prodinfo.new(pogo_params)
				if @s.save
					respond_to do |format|
						format.html {redirect_to action:'index'}
						format.js {@msg = 'Property Saved successfully'}
					end
				else
					respond_to do |format|
						format.html {redirect_to :back , notice: @s.errors.full_messages}
						format.js {@msg = @s.errors.full_messages}
					end
				end
			end

			def update
				@bn = Prodinfo.find(params[:id])
				if @bn.update_attributes(pogo_params)
					flash[:success] = "Property successfully updated"
				else
					flash[:error] = @bn.errors.full_messages
				end
				redirect_to action: 'index'
			end

			def destroy
				@bn = Prodinfo.find(params[:id])
				if @bn.destroy
					flash[:success] = "Property successfully deleted"
				else
					flash[:error] = @bn.errors.full_messages
				end
				redirect_to action:'index'
			end
			private
				def pogo_params
					params.require(:prodinfo).permit(:length, :width, :height, :size, :material, :instructions, :product_id)
				end

		end
	end
end