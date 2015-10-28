Product.destroy_all
Review.destroy_all

products = []

(1..50).each do |m|
  	products << Product.create(
		name: Faker::Commerce.product_name,
		description: Faker::Lorem.sentence,
		price: Faker::Commerce.price,
		stock: rand(1..100)
		)

	end

reviews= []

(1..20).each do |r|
	reviews << Review.create(
		content: Faker::Lorem.paragraph(3)
	)
end