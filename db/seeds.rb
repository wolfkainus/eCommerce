Product.destroy_all
Review.destroy_all
User.destroy_all
Category.destroy_all

products = []

(1..50).each do |m|
  	products << Product.create(
		name: Faker::Commerce.product_name,
		description: Faker::Lorem.sentence,
		price: Faker::Commerce.price,
		stock: rand(1..100)#,
		#category: categories[rand(categorias.length)],
		#remote_image_url: 'http://lorempixel.com/1000'
		)

	end

reviews= []

(1..20).each do |r|
	reviews << Review.create(
		content: Faker::Lorem.paragraph(3)
	)
end

users = []

users << User.create(
  name: 'Alfredo',
  last_name: 'Lobos',
  username: 'wolfkainus',
  email: 'editor@editor.com',
  password: '12345678',
  role: 0
)

category = []

category << Category.create(name: 'Categoria 1')
category << Category.create(name: 'Categoria 2')
category << Category.create(name: 'Categoria 3')
