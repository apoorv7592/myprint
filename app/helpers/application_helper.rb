module ApplicationHelper
	def resource_name
	    :spree_user
	  end
	 
	  def resource
	    @resource ||= Spree::User.new
	  end
	 
	  def devise_mapping
	    @devise_mapping ||= Devise.mappings[:spree_user]
	  end
end
