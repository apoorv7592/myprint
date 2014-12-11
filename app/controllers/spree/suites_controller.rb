module Spree
	class SuitesController < Spree::HomeController
		def show
<<<<<<< HEAD

			@s = Suite.find(params[:id])
			@prds = @Suite.spree_products
		end
	end	
end
=======
			@suite = Suite.find(params[:id])
			@prds = @suite.spree_products
		end
	end
end
>>>>>>> 4258b7ae6292be235e8e416f9141128e61263db4
