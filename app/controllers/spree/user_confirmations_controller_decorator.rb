Spree::UserConfirmationsController.class_eval do
	def after_confirmation_path_for(resource_name, resource)
		if signed_in?(resource_name) && resource.is_designer?		
			'/designers/complete_account'
		else
			signed_in?(resource_name) ? spree.signed_in_root_path(resource) : spree.login_path
		end
	end
end