module Spree
	module Admin
		class SimilarprodsController < Spree::Admin::BaseController
			def index
				@similarprods = Similarprod.all
			end

			def new
				@similarprod = Similarprod.new
			end

			def edit
				@similarprod = Similarprod.find(params[:id])
			end

			def show
				@similarprod = Similarprod.find(params[:id])
			end

			def create
				@s = Similarprod.new(pogo_params)
				if @s.save
					respond_to do |format|
						format.html {redirect_to action:'index'}
						format.js {@msg = 'Similarprod Saved successfully'}
					end
				else
					respond_to do |format|
						format.html {redirect_to :back , notice: @s.errors.full_messages}
						format.js {@msg = @s.errors.full_messages}
					end
				end
			end

			def update
				@bn = Similarprod.find(params[:id])
				if @bn.update_attributes(pogo_params)
					flash[:success] = "Similarprod successfully updated"
				else
					flash[:error] = @bn.errors.full_messages
				end
				redirect_to action: 'index'
			end

			def destroy
				@bn = Similarprod.find(params[:id])
				if @bn.destroy
					flash[:success] = "Similarprod successfully deleted"
				else
					flash[:error] = @bn.errors.full_messages
				end
				redirect_to action:'index'
			end



			def import
			  Similarprod.import(params[:file])
			  redirect_to action: 'index', notice: " Similar products imported."
			end


			private
				def pogo_params
					params.require(:similarprod).permit(:product_name, :product_id, :prod1, :prod2, :prod3, :prod4, :prod5, :prod6, :prod7, :prod8 )
				end
		end
	end
end