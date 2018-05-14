# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PASSWORD = "secretpass"
Review.destroy_all
Product.destroy_all
User.destroy_all

super_user = User.create(
  first_name: "Jon",
  last_name: "Snow",
  email: "js@winterfell.gov",
  password: PASSWORD
)

22.times.each do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name}.#{last_name}@nasa.gov",
        password: PASSWORD
    )
end
users = User.all

101.times.each do
    p = Product.create(
        title: Faker::Space.star_cluster, 
        description: Faker::Space.constellation,
        price: Faker::Commerce.price,
        user: users.sample
    )
    if p.valid?
        rand(0..10).times.each do
          Review.create(
            body: Faker::Fallout.quote,
            product: p,
            rating: rand(0..5),
            user: users.sample
          )
        end
    end
end

products = Product.all
reviews = Review.all
puts Cowsay.say "Created #{users.count} users", :ren
puts Cowsay.say "Created #{products.count} products", :daemon
puts Cowsay.say "Created #{reviews.count} reviews", :stimpy