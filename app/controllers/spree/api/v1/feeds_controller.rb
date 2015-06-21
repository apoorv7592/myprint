module Spree
	module Api
		module V1
			class FeedsController < Spree::HomeController
				respond_to :json
				
				def get_default_feed
					random_ids = Spree::Product.ids.sort_by{rand}.slice(0, 25)	
					@results = Spree::Product.where(id: random_ids)
				end

				def get_user_feed(user)
				end
			end
		end
	end
end