class Order < ApplicationRecord
	belongs_to :user
	# Association avec les articles
	has_many :order_item_joins
	has_many :items, through: :order_item_joins

	def order_send
    UserMailer.order_email(self.user, self).deliver_now
  end

  def send_confirmation_to_admin
  	# Récap envoyé à un user aléatoire
  	UserMailer.order_confirmation_to_admin(User.all.sample, self).deliver_now
  end

  def total_price
		prices = []
		self.items.each do |item|
			prices << item.price
		end
		prices.reduce(:+)
	end

end
