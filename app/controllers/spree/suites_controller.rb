module Spree
	class SuitesController < ApplicationController
		def show

			@s = Suite.find(params[:id])
			@prds = @Suite.spree_products
		end
	end	
end
