# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "let's seed..."

puts "Destroy all previous Items"

Item.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('items')
puts "Create Items"

11.times do |i|

	Item.create!(
		title: Faker::Marketing.buzzwords,
		description: Faker::Lorem.paragraph,
    price: [1, 5, 8, 10, 12, 15, 20, 50].sample,
    image_url: "http://localhost:3000/assets/#{i + 1}.jpg",
		)

end

puts "Done!"

