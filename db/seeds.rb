# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.destroy_all
Review.destroy_all

products = []

(1..20).each do |m|
  products << Product.create(
    name: Faker::Address.street_name,
    descripcion: Faker::Lorem.paragraph(20, true, 10)#,
    price: Faker::Commerce.price #=> "44.6"
    stock: Faker::Number.between(1, 10) #=> 7
    #user: users[rand(users.length)]
  )
end

#reviews = []

#(1..50).each do |r|
#  reviews << Review.create(
#    content: Faker::Lorem.paragraph(3),
#    review: reviews[rand(reviews.length)]#,
#    #user: users[rand(users.length)]
#  )
#end
