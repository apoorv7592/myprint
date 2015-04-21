module Spree
	class LeadMailer < ActionMailer::Base
	  default from: "support@prindora.com"

	  def send_signup_mail
	  	mail(to: 'ast0708@gmail.com', subject: 'Welcome to My Awesome Site')
	  end
	end
end