module Spree
	class SuitesController < ApplicationController
		def show
			@suite = Suite.find(params[:id])
			@prds = @suite.spree_products
		end
	end
end