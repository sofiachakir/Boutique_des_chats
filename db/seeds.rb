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

CartItemJoin.all.destroy_all
OrderItemJoin.all.destroy_all
Order.all.destroy_all
Cart.all.destroy_all
Item.all.destroy_all
User.all.destroy_all

# Remettre les compteurs à 0
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

puts "Create Admin account"
User.create(email: "meiko.boutique@yopmail.com", password: "motdepasse", is_admin: true)

puts "Done!"