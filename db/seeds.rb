# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create({
  name: "Hippolyta",
  email: "contact@hippolyta.com",
  password: "hippolyta",
})

u1.picture = File.open(File.join(Rails.root, "/app/assets/images/seed/hippolyta_logo.png"))
u1.save!

p1 = Product.create({
  name: "Hungry Hungry Hippos",
  seller_id: u1.id,
  sale_price: 30.69,
  quantity: 100,
  description: "You’ll have a chompin’ good time with Hungry Hippo and his pals. Be ready to join in the feeding frenzy when you release all the marbles onto the game base, because all the hippos will be chomping and your hippo will need to move fast. If it chomps the golden marble, you win.",
  image_url: "/product_images/hungry_hippos_small.jpg"
})

p2 = Product.create({
  name: "Hiphopopotamus Board Games",
  seller_id: u1.id,
  sale_price: 26.69,
  quantity: 100,
  description: "The early counting game. Hop and count your way across the river but don't get caught by the Hippopotamus. Teach counting from 1-20, simple addition, subtraction and number sequencing. Contains floor mat, inflatable die and game guide. For 1 to 4 players. For ages 4 to 6 years.",
  image_url: "/product_images/hiphopopotamus_small.jpg"
})

p3 = Product.create({
  name: "Hiphopopotamus vs. Rhymenoceros [feat. Rhymenocerous and the Hiphopopotamus]",
  seller_id: u1.id,
  original_price: 20.00,
  sale_price: 18.53,
  quantity: 100,
  description: "As heard on the HBO show, and from the album, Flight Of The Conchords.",
  image_url: "/product_images/fotc_small.jpg"
})

p4 = Product.create({
  name: "Purple 16oz Insulated Stainless Steel Travel Mug Z431 Keep Calm and Love Hippos",
  seller_id: u1.id,
  sale_price: 19.19,
  quantity: 100,
  description: "16 oz. travel mug with stainless steel outer wall, color accents, and matching insulated liner. Double wall plastic inner liner insulation. Smooth curved body for easy grab-N-go handling. Plastic lid with a spill prevention slide lock.",
  image_url: "/product_images/keep_calm_thermos_small.jpg"
})
