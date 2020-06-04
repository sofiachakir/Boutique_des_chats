class UserMailer < ApplicationMailer
	default from: 'meiko.boutique@gmail.com'

	def welcome_email(user)
		@user = user
		@url = 'https://boutique-des-chats.herokuapp.com/'
		mail(to: @user.email, subject: 'Bienvenue sur notre boutique !')
	end

	def order_email(user, order)
		@user = user
		@order = order
		@items = @order.items
		@items.each do |item|
			@filename = item.id.to_s + item.picture.filename.extension_with_delimiter
			attachments.inline[@filename] = item.picture.download
		end
		
		mail(to: @user.email, subject: 'Merci pour votre commande !')
	end

	def order_confirmation_to_admin(user, order)
		@user = user
		@order = order
		@items = @order.items
		
		mail(to: @user.email, subject: 'Une nouvelle commande effectuée sur Meiko Boutique !')
	end
	
end