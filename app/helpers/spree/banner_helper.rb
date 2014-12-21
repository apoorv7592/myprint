module Spree
	module BannerHelper
		def get_banner(category, position)
			if category && position
				Banner.where(category: category, position: position)
			else
				"Banner Category or position not supplied"
			end
		end
	end
end