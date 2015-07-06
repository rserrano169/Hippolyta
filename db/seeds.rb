# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

USER_NAMES = {
  0 => "Hippolyta",
  1 => "Angela",
  2 => "Raul",
  3 => "Mark",
  4 => "Aracely",
}
USER_EMAILS = {
  0 => "hippolyta",
  1 => "angela",
  2 => "raul",
  3 => "mark",
  4 => "aracely",
}

P_WORDS = "hippolyta"

USER_PIC_URLS = {
  0 => "/app/assets/images/seed/hippolyta_hippo.png",
  1 => nil,
  2 => nil,
  3 => nil,
  4 => nil,
}

user_num = 0
while user_num < USER_NAMES.length
  user_pic = nil
  if USER_PIC_URLS[user_num]
    user_pic = File.open(File.join(Rails.root, USER_PIC_URLS[user_num]))
  end

  user = User.create!({
    name: USER_NAMES[user_num],
    email: "#{USER_EMAILS[user_num]}@hippolyta.us",
    password: P_WORDS,
    picture: user_pic
  })

  user_num += 1
end

PRODUCT_NAMES = {
  0 => "Hungry Hungry Hippos",
  1 => "Hiphopopotamus Board Games",
  2 => "Hiphopopotamus vs. Rhymenoceros [feat. Rhymenocerous and the Hiphopopotamus]",
  3 => "Purple 16oz Insulated Stainless Steel Travel Mug Z431 Keep Calm and Love Hippos",
  4 => 'Aurora World Aurora Plush 12" Hippo Tubbie Wubbie',
  5 => "FHC Children's Hippo Animal Chair",
  6 => "Design Toscano Huey The Hippo Garden Statue",
}

PRODUCT_SELLER_IDS = {
  0 => 1,
  1 => 1,
  2 => 1,
  3 => 1,
  4 => 1,
  5 => 2,
  6 => 2,
}

PRODUCT_ORIGINAL_PRICES = {
  0 => nil,
  1 => nil,
  2 => 18.53,
  3 => nil,
  4 => 11.99,
  5 => 129.99,
  6 => 50.90,
}

PRODUCT_SALE_PRICES = {
  0 => 30.69,
  1 => 26.69,
  2 => 20.00,
  3 => 19.19,
  4 => 10.27,
  5 => 39.99,
  6 => 43.90,
}

PRODUCT_QUANTITIES = {
  0 => 100,
  1 => 100,
  2 => 100,
  3 => 100,
  4 => 19,
  5 => 24,
  6 => 8,
}

PRODUCT_DESCRIPTIONS = {
  0 => "You’ll have a chompin’ good time with Hungry Hippo and his pals. Be ready to join in the feeding frenzy when you release all the marbles onto the game base, because all the hippos will be chomping and your hippo will need to move fast. If it chomps the golden marble, you win.",
  1 => "The early counting game. Hop and count your way across the river but don't get caught by the Hippopotamus. Teach counting from 1-20, simple addition, subtraction and number sequencing. Contains floor mat, inflatable die and game guide. For 1 to 4 players. For ages 4 to 6 years.",
  2 => "As heard on the HBO show, and from the album, Flight Of The Conchords.",
  3 => "16 oz. travel mug with stainless steel outer wall, color accents, and matching insulated liner. Double wall plastic inner liner insulation. Smooth curved body for easy grab-N-go handling. Plastic lid with a spill prevention slide lock.",
  4 => "Realistic Styling. Wonderful Gift Item. Fine Plush Fabric. Premier manufacturer of gift plush. Soft and cuddly.",
  5 => "WOW! This adorable Hippo chair is the perfect gift for any baby to a young child. It's cute design and super soft material creates a multi-use piece. It is first and foremost a cozy chair, but it is also a giant stuffed animal, and it will certainly brighten the decor of any room. It is the perfect gift for your children, grandchildren, or any other adorable young one you know. It is irresistibly soft and designed to function as a chair, but it is durable enough for a childhood of unlimited HUGS and CUDDLES",
  6 => "Guests won’t know what to expect when they notice the Huey the Hippo Garden Sculpture popping his head up from your garden, patio, or yard. This whimsical sculpture will liven up any setting and is perfect indoors or out. It’s made of cast resin and hand painted in striking detail.",
}

PRODUCT_PIC_URLS = {
  0 => "/app/assets/images/seed/hungry_hippos_image.jpg",
  1 => "/app/assets/images/seed/hiphopopotamus_board_game_image.jpg",
  2 => "/app/assets/images/seed/fotc.jpg",
  3 => "/app/assets/images/seed/keep_calm_thermos.jpg",
  4 => "/app/assets/images/seed/aurora_world_aurora_plush_12in_hippo.jpg",
  5 => "/app/assets/images/seed/childrens_hippo_animal_chair.jpg",
  6 => "/app/assets/images/seed/design_toscano_huey_the_hippo_garden_statue.jpg",
}

PRODUCT_TAG_NAMES = {
  0 => [
    "hippo",
    "hippopotamus",
    "games",
    "toys",
    "kids",
    "children",
    "tabletop games",
    "marbles",
    "1970",
    "animals"
  ],
  1 => [
    "hippopotamus",
    "hippo",
    "board game",
    "kids",
    "children",
    "math",
    "animals"
  ],
  2 => [
    "hippo",
    "hippopotamus",
    "music",
    "comedy",
    "comedian",
    "New Zealand",
    "CD",
    "MP3",
    "download",
    "animals"
  ],
  3 => [
    "hippo",
    "hippopotamus",
    "drink",
    "coffee",
    "tea",
    "hot liquid",
    "animals",
    "novelty"
  ],
  4 => [
    "hippo",
    "hippopotamus",
    "toys",
    "stuffed",
    "animals",
    "kids",
    "children"
  ],
  5 => [
    "hippo",
    "hippopotamus",
    "furniture",
    "kids",
    "children",
    "plush",
    "stuffed",
    "animals",
    "polyester",
    "large",
    "big"
  ],
  6 => [
    "hippo",
    "hippopotamus",
    "furniture",
    "resin",
    "hand painted",
    "patio",
    "lawn",
    "chair",
    "sculpture",
    "outdoor"
  ],
}

prod_num = 0
while prod_num < PRODUCT_NAMES.length
  prod_pic = nil
  if PRODUCT_PIC_URLS[prod_num]
    prod_pic = File.open(File.join(Rails.root, PRODUCT_PIC_URLS[prod_num]))
  end

  product = Product.create!({
    name: PRODUCT_NAMES[prod_num],
    seller_id: PRODUCT_SELLER_IDS[prod_num],
    original_price: PRODUCT_ORIGINAL_PRICES[prod_num],
    sale_price: PRODUCT_SALE_PRICES[prod_num],
    quantity: PRODUCT_QUANTITIES[prod_num],
    description: PRODUCT_DESCRIPTIONS[prod_num],
    picture: prod_pic
  })

  PRODUCT_TAG_NAMES[prod_num].each do |tag_name|
    tag = Tag.find_by(name: tag_name)
    if tag && product.tags.include?(tag)
      product.tags << tag
    elsif tag.nil?
      product.tags.create!({name: tag_name})
    end
  end

  prod_num += 1
end
