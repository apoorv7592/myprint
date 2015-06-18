OmniAuth::Strategies::Facebook.class_eval do
  def request_phase
    # Set your permissions here....
    options[:scope] ||= "email,user_location,user_birthday"
    options[:display] = mobile_request? ? 'touch' : 'page'
    super
  end
end
