module SearchExtensions

	def retrieve_suites
	    
		curr_page = page || 1

		@suites= get_suite_scope
		curr_page = page || 1
		#unless Spree::Config.show_suites_without_price
		#@suites = @suites.where("spree_prices.amount IS NOT NULL").where("spree_prices.currency" => current_currency)
		#end
		
		@suites = @suites.page(curr_page).per(per_page) unless @suites.nil?
	end

	protected 
	 	def get_suite_scope
	 		suite_scope = Suite.active
	 		#suite_scope = get_name_scope(suite_scope)
	 		#suite_scope = sort_by_name(suite_scope, '')
	 	end

	 	def get_name_scope(scope)
	 		scope = scope.where( name: 'test')
	 	end

	 	def sort_by_name(scope, ord= nil)
	 		if ord=='asc'
	 			scope = scope.order('name')
	 		elsif ord=='dsc'
	 			scope= scope.order('name DSC')
	 		else
	 			scope
	 		end
	 	end

end

Spree::Core::Search::Base.class_eval do 
	prepend SearchExtensions
end
