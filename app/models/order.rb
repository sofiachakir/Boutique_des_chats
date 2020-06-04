class Order < ApplicationRecord
	belongs_to :user
	# Association avec les articles
	has_many :order_item_joins
	has_many :items, through: :order_item_joins

	def order_send
    UserMailer.order_email(self.user, self).deliver_now
  end

  def send_confirmation_to_admin
  	# Récap envoyé à l'admin
  	admin = User.find_by(email: "meiko.boutique@yopmail.com")
  	UserMailer.order_confirmation_to_admin(admin, self).deliver_now
  end

  def total_price
		prices = []
		self.items.each do |item|
			prices << item.price
		end
		prices.reduce(:+)
	end

	def self.average_price
    if self.all.length == 0
      return 0
    else
			orders_total_prices = []
			self.all.each do |order|
				orders_total_prices << order.total_price
			end
			orders_total_prices.reduce(:+) / orders_total_prices.size.to_f
	  end
	end

end
