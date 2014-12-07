module Spree
	class SuitesController < ApplicationController
		def show
			@s = Suite.find(params[:id])
		end
	end	
end