module Spree
	module Admin
 
			class CharacteristicsController < Spree::Admin::BaseController
				def index
					
					@characteristics = Characteristic.all
				end

				def show
					@characteristic = Characteristic.find(params[:id])			
				end

				def new
					@characteristic = Characteristic.new
				end
				
				def create
					@characteristic = Characteristic.new(characteristics_params)

					if @characteristic.save
						respond_to do |format|
							format.html {redirect_to action:'index'}
							format.js {@msg = 'Suite Characteristic Saved successfully'}
						end
					else
						respond_to do |format|
							format.html {redirect_to :back , notice: 'Some error occured'}
							format.js {@msg = 'Some error occured'}
						end
					end
				end

				def edit
					@characteristic = Characteristic.friendly.find(params[:id])
				end

				

				def update
					@s = Characteristic.find(params[:id])

					if @s.update(characteristics_params)
						respond_to do |format|
							format.html {redirect_to admin_suites_characteristic_path(@s), message:'Suite Characteristic updated successfully'}
						end
					else
						respond_to do |format|
							format.html {redirect_to :back , notice: 'Some error occured'}
						end
					end
				end

				def destroy
					@characteristic = Characteristic.find(params[:id])					
					if @characteristic.destroy
						redirect_to admin_suite_characteristics_path, message:'Suite Characteristic deleted successfully'
					else
						redirect_to :back, message:'Some error occured'
					end
				end

				private
				def characteristics_params

					params.require(:characteristic).permit(:name, :suite_id, :variant_id, :avatar)

				end 
            end				
	end
end