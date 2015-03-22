class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #after_filter :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get? 
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end
  
  def after_sign_in_path_for(resource)
    if spree_current_user.has_spree_role?("admin")
      admin_path
    elsif spree_current_user.is_designer?
      d= spree_current_user.designer
      if !d.present? or !d.basic_complete?
        '/complete_account' #rails helper gives the wrong path, not sure why
      else
        session[:previous_url] || root_path
      end
    else
      session[:previous_url] || root_path
    end
  end

end


module ApplicationHelper
#for current user to use through out the app
   def current_user
     spree_current_user
     @current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id]) 
     # Use find_by_id to get nil instead of an error if user doesn't exist
   end

end