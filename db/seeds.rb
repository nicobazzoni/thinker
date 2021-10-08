# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
c1 = Category.create(name: "Negative")
c2 = Category.create(name: "Positive")
c3 = Category.create(name: "Neutral")


i1 = Thinker.create(name: "Ace ", 
  
  image: "https://www.wildfang.com/media/catalog/product/cache/image/555x777/beff4985b56e3afdbeabfc89641a4582/8/-/8-xacetuxblazerinlightgrey.jpg", 
  times_studied: 4,
  category_id: 1)

i2 = Thinker.create(name: "BUCKO", 

image: "https://www.wildfang.com/media/catalog/product/cache/image/555x777/beff4985b56e3afdbeabfc89641a4582/8/-/8-xacetuxblazerinlightgrey.jpg", 
times_studied: 10,
category_id: 2)


o1 = Idea.create(quote: "IM doing stuff bro",
  likes: 0)

o1.thinkers << [i1, i2]

o2 = Idea.create(quote: "Get my things in order", likes: 5)

o2.thinkers << [i2, i1]
puts "yo"