module Spree
	class LeadMailer < ActionMailer::Base
	  default from: "support@prindora.com"

	  def send_signup_mail(email)
	  	mail(to: email, subject: 'Thanks for choosing Prindora, your dedicated designer will contact you soon!')
	  end
	end
end