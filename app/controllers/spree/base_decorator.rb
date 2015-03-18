Spree::BaseController.class_eval do
	def current_user
     	spree_current_user
     	@current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id]) 
     # Use find_by_id to get nil instead of an error if user doesn't exist
   end
end