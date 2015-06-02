require 'sass/rails'
require 'spree_core'
require 'spree_reviews/engine'
require 'spree_reviews/version'
require 'coffee_script'


	module Designerreviews
		module_function
			def config(*)
				yield(Designerreviews::Config)
			end
		end
    