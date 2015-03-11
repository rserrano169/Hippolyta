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
  logo_image_url: "/assets/images/user_logos/hippolyta_logo.png"
})

p1 = Product.create({
  name: "Hungry Hungry Hippos",
  seller_id: u1.id,
  sale_price: 30.69,
  quantity: 100,
  image_url: "/assets/images/user_logos/hungry_hippos_small.jpg"
})

p2 = Product.create({
  name: "Hiphoppopotamus Board Games",
  seller_id: u1.id,
  sale_price: 26.69,
  quantity: 100,
  image_url: "/assets/images/user_logos/hiphoppopotamus_small.jpg"
})

p3 = Product.create({
  name: "Hiphopopotamus vs. Rhymenoceros [feat. Rhymenocerous and the Hiphopopotamus]",
  seller_id: u1.id,
  sale_price: 18.53,
  quantity: 100,
  image_url: "/assets/images/user_logos/fotc_small.jpg"
})

p4 = Product.create({
  name: "Purple 16oz Insulated Stainless Steel Travel Mug Z431 Keep Calm and Love Hippos",
  seller_id: u1.id,
  sale_price: 19.19,
  quantity: 100,
  image_url: "/assets/images/user_logos/keep_calm_thermos_small.jpg"
})
