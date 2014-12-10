module Spree
	class SuitesController < Spree::HomeController
		def show
			@suite = Suite.find(params[:id])
			@prds = @suite.spree_products
		end
	end
end