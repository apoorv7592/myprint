Spree::UserConfirmationsController.class_eval do
	def after_confirmation_path_for(resource_name, resource)

			signed_in?(resource_name) ? spree.signed_in_root_path(resource) : spree.login_path
	end
end