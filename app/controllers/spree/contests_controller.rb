module Spree
	class ContestsController < Spree::HomeController

		def index
		end
		
		def show
			@entry = Entry.new
		end

	end
end