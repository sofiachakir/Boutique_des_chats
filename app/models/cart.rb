class Cart < ApplicationRecord
	belongs_to :user
	has_many :cart_item_joins
	has_many :items, through: :cart_item_joins
end
