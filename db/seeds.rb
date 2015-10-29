Product.destroy_all
Review.destroy_all

products = []

(1..50).each do |m|
  	products << Product.create(
		name: Faker::Commerce.product_name,
		description: Faker::Lorem.sentence,
		price: Faker::Commerce.price,
		stock: rand(1..100)
		#category: categories[rand(categorias.length)],
		remote_image_url: 'http://lorempixel.com/2000/1000'
		)

	end

reviews= []

(1..20).each do |r|
	reviews << Review.create(
		content: Faker::Lorem.paragraph(3)
	)
end