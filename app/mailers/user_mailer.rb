class UserMailer < ApplicationMailer
	default from: 'meiko.boutique@gmail.com'

	def welcome_email(user)
		@user = user
		@url = 'https://monsite.com/'
		mail(to: @user.email, subject: 'Bienvenue sur notre super site!')
	end
	
end