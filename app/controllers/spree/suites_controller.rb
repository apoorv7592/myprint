module Spree
	class SuitesController < Spree::HomeController
		def show
			@suites = Suite.retrieve_suites
			@suite = Suite.find(params[:id])
			@prds = @suite.spree_products
		end
	end	
end
