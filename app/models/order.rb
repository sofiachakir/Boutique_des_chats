class Order < ApplicationRecord
	belongs_to :user
	# Association avec les articles
	has_many :order_item_joins
	has_many :items, through: :order_item_joins
end
