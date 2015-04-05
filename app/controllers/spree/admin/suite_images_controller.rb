module Spree
	module Admin
		class SuiteImagesController < Spree::Admin::BaseController
			def new
				@img = SuiteImage.new
			end
		end
	end
end