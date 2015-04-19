module Spree
	module Admin
		class LeadsController < Spree::Admin::BaseController
			
			def index
				@leads = Lead.all.order('created_at desc')
			end

			def edit
				@lead = Lead.find(params[:id])
			end
		end
	end
end