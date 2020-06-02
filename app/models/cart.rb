class Cart < ApplicationRecord
	belongs_to :user
	has_many :cart_item_joins
	has_many :items, through: :cart_item_joins

	def total_price
		prices = []
		self.items.each do |item|
			prices << item.price
		end
		prices.reduce(:+)
	end
end
