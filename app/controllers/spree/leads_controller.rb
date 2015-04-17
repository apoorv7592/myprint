module Spree
	class LeadsController < Spree::HomeController
	
		    def index
			    @leads = Lead.all
		    end
		  
		    def show
		        @lead = Lead.find(params[:id])
		    end

		    def new
		        @lead = Lead.new
		    end

			def edit
				@lead = Lead.find(params[:id])
			end

			def create
			    @lead = Lead.new(lead_params)
			    if @lead.save
					redirect_to :back, message:'Our Designer will contact you soon'
				else
					redirect_to :back, message:'Some error occured'
				end
			end

			def destroy
				@lead = Lead.find(params[:id])
				if @lead.destroy
					redirect_to :back, message:'Lead deleted successfully'
				else
					redirect_to :back, message:'Some error occured'
				end
			end
          
          private
			def lead_params
                   params.require(:lead).permit(:name, :email, :contact, :city, :gender, :product_id, :url)
            end

    end
end