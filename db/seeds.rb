# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'faker'

puts "let's seed..."

puts "Destroy all previous Items"

CartItemJoin.destroy_all
OrderItemJoin.destroy_all
Order.destroy_all
Cart.destroy_all
Item.destroy_all
User.destroy_all

# Remettre les compteurs à 0
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

puts "Create Admin account"
User.create(email: "meiko.boutique@yopmail.com", password: "motdepasse", is_admin: true)

puts "Done!"