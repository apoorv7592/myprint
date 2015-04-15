module Spree
	module Admin
		class PogosController < Spree::Admin::BaseController
			def index
				@pogos = Pogo.all
			end

			def new
				@pogo = Pogo.new
			end

			def edit
				@pogo = Pogo.find(params[:id])
			end

			def create
				@s = Pogo.new(pogo_params)
				if @s.save
					respond_to do |format|
						format.html {redirect_to action:'index'}
						format.js {@msg = 'Pogo Saved successfully'}
					end
				else
					respond_to do |format|
						format.html {redirect_to :back , notice: @s.errors.full_messages}
						format.js {@msg = @s.errors.full_messages}
					end
				end
			end

			def update
				@bn = Pogo.find(params[:id])
				if @bn.update_attributes(pogo_params)
					flash[:success] = "Banner successfully updated"
				else
					flash[:error] = @bn.errors.full_messages
				end
				redirect_to action: 'index'
			end

			def destroy
				@bn = Pogo.find(params[:id])
				if @bn.destroy
					flash[:success] = "Banner successfully deleted"
				else
					flash[:error] = @bn.errors.full_messages
				end
				redirect_to action:'index'
			end
			private
				def pogo_params
					params.require(:pogo).permit(:avatar, :category, :position)
				end

		end
	end
end