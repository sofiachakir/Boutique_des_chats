class Item < ApplicationRecord

	# Titre obligatoire
	validates :title, presence: true
	# Description obligatoire
	validates :description, presence: true
	# Prix obligatoire, supérieur à 0
	validates :price, presence: true, numericality: { greater_than: 0 }
	# Image obligatoire
	validates :image_url, presence: true

end
