module Spree
	class DedicateddesignerController < Spree::HomeController
	
		def dedicateddesigner
			@lead = Lead.new
			
		end
	end
end