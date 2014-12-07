module Spree
	class SuitesController < ApplicationController
		def show
			@s = Suite.find(params[:id])
			@p = @s.spree_products
		end
	end	
end