module Spree
	class SuitesController < ApplicationController
		def show
<<<<<<< HEAD
			@s = Suite.find(params[:id])
			@p = @s.spree_products
		end
	end	
=======
			@suite = Suite.find(params[:id])
			@prds = @suite.spree_products
		end
	end
>>>>>>> e558f3237f4aa3ed68f46f8c5f1f1e83e22f340b
end