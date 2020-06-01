# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do 
	Item.create!(
		title: Faker::Marketing.buzzwords, 
		description: Faker::Lorem.paragraph,
    	price: [0, 5, 8, 10, 12, 15, 20, 50].sample,
    	image_url: Faker::Image.mageUrl,
		)
end