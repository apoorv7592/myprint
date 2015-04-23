module Spree
	class WelcomeMailer < ActionMailer::Base
	  default from: "support@prindora.com"

	  def send_welcome_mail(email)
	  	mail(to: email, subject: 'Welcome to Prindora!')
	  end
	end
end