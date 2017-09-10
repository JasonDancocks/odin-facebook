class UserMailer < ApplicationMailer
	default from: "notifactions@example.com"

	def welcome_email(user)
		@user = user
		@url = "http://example.com"
		mail(to: @user.email, subject: "Welcome to Odin Facebook")
	end

end
