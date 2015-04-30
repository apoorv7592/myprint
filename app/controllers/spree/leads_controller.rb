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
			      Spree::LeadMailer.delay.send_signup_mail
			      redirect_to @lead
			    else
					redirect_to :back, notice: @lead.errors.full_messages
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