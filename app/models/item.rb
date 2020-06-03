class Item < ApplicationRecord

	# Titre obligatoire
	validates :title, presence: true
	# Description obligatoire
	validates :description, presence: true
	# Prix obligatoire, supérieur à 0
	validates :price, presence: true, numericality: { greater_than: 0 }
	# Image obligatoire
	# validates :image_url, presence: true
	
	# Association avec le panier
	has_many :cart_item_joins
	has_many :carts, through: :cart_item_joins
	# Association avec la commande
	has_one_attached :picture
	has_many :order_item_joins
	has_many :orders, through: :order_item_joins

end
