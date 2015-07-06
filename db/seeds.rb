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
  0 => "hippolyta_hippo.png",
  1 => nil,
  2 => nil,
  3 => nil,
  4 => nil,
}

user_num = 0
while user_num < USER_NAMES.length
  user_pic = nil
  if USER_PIC_URLS[user_num]
    user_pic = File.open(
      File.join(
        Rails.root, "/app/assets/images/seed/#{USER_PIC_URLS[user_num]}"
      )
    )
  end

  user = User.find_by(email: "#{USER_EMAILS[user_num]}@hippolyta.us")
  if user
    user.update_attributes!({
      name: USER_NAMES[user_num],
      email: "#{USER_EMAILS[user_num]}@hippolyta.us",
      password: P_WORDS,
      picture: user_pic
    })
  else
    user = User.create!({
      name: USER_NAMES[user_num],
      email: "#{USER_EMAILS[user_num]}@hippolyta.us",
      password: P_WORDS,
      picture: user_pic
    })
  end

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
  7 => "Hippo Door Mat",
  8 => 'R&M Hippo 4" Cookie Cutter in Durable, Economical, Tinplated Steel',
  9 => "Hippos Attractives Salt Pepper Shaker Made of Ceramic",
  10 => "Thomas And Friends Wooden Railway - Zoo Car",
  11 => "Baby Aspen, Hug-alot-amus Hooded Hippo Robe, Purple, 0-6 Months",
  12 => "Cartoon Hippo Vinyl Decal Sticker for wall or car (pink, 5 inch)",
  13 => "Race Car Bouncing Balls (1 dozen) - Bulk [Toy]",
  14 => "My Pillow Pets Hungry Hippo - Large (Lavender)",
}

PRODUCT_SELLER_IDS = {
  0 => 1,
  1 => 1,
  2 => 1,
  3 => 1,
  4 => 1,
  5 => 2,
  6 => 2,
  7 => 2,
  8 => 2,
  9 => 2,
  10 => 3,
  11 => 3,
  12 => 3,
  13 => 3,
  14 => 3,
}

PRODUCT_ORIGINAL_PRICES = {
  0 => nil,
  1 => nil,
  2 => 18.53,
  3 => nil,
  4 => 11.99,
  5 => 129.99,
  6 => 50.90,
  7 => nil,
  8 => nil,
  9 => nil,
  10 => 50.00,
  11 => 30.00,
  12 => 7.95,
  13 => nil,
  14 => nil,
}

PRODUCT_SALE_PRICES = {
  0 => 30.69,
  1 => 26.69,
  2 => 20.00,
  3 => 19.19,
  4 => 10.27,
  5 => 39.99,
  6 => 43.90,
  7 => 156.00,
  8 => 4.32,
  9 => 10.17,
  10 => 33.82,
  11 => 21.21,
  12 => 4.86,
  13 => 7.07,
  14 => 24.99,
}

PRODUCT_QUANTITIES = {
  0 => 100,
  1 => 100,
  2 => 100,
  3 => 100,
  4 => 19,
  5 => 24,
  6 => 8,
  7 => 100,
  8 => 8,
  9 => 3,
  10 => 100,
  11 => 100,
  12 => 6,
  13 => 100,
  14 => 24,
}

PRODUCT_DESCRIPTIONS = {
  0 => "You’ll have a chompin’ good time with Hungry Hippo and his pals. Be ready to join in the feeding frenzy when you release all the marbles onto the game base, because all the hippos will be chomping and your hippo will need to move fast. If it chomps the golden marble, you win.",
  1 => "The early counting game. Hop and count your way across the river but don't get caught by the Hippopotamus. Teach counting from 1-20, simple addition, subtraction and number sequencing. Contains floor mat, inflatable die and game guide. For 1 to 4 players. For ages 4 to 6 years.",
  2 => "As heard on the HBO show, and from the album, Flight Of The Conchords.",
  3 => "16 oz. travel mug with stainless steel outer wall, color accents, and matching insulated liner. Double wall plastic inner liner insulation. Smooth curved body for easy grab-N-go handling. Plastic lid with a spill prevention slide lock.",
  4 => "Realistic Styling. Wonderful Gift Item. Fine Plush Fabric. Premier manufacturer of gift plush. Soft and cuddly.",
  5 => "WOW! This adorable Hippo chair is the perfect gift for any baby to a young child. It's cute design and super soft material creates a multi-use piece. It is first and foremost a cozy chair, but it is also a giant stuffed animal, and it will certainly brighten the decor of any room. It is the perfect gift for your children, grandchildren, or any other adorable young one you know. It is irresistibly soft and designed to function as a chair, but it is durable enough for a childhood of unlimited HUGS and CUDDLES",
  6 => "Guests won’t know what to expect when they notice the Huey the Hippo Garden Sculpture popping his head up from your garden, patio, or yard. This whimsical sculpture will liven up any setting and is perfect indoors or out. It’s made of cast resin and hand painted in striking detail.",
  7 => 'Provide a "hip" and hefty hello at the front door with the Droog Hippo Door Mat. Designed by Ed Annink, the Hippo Door Mat has an unmistakable and playful shape taken from a copyright-free Gerd Arntz pictogram and made out of a durable and natural-looking combination of coir and PVC.',
  8 => "CybrTrayd-R&M heavy-duty tinplate steel cookie cutters are strong and built to hold their shapes. However, they are not dishwasher-safe and should be hand washed in warm, soapy water and towel dried.",
  9 => 'Salt & Pepper Shakers Set. Size: ~3" - 4". Not Dishwasher or Microware Safe. Made of High Quaility Ceramic. Not Recommended For Children Under 12. 100% Licensed Product.',
  10 => "The Island of Sodor is alive with jungle animals, as the Zoo Cars are transporting lions and hippos! The lion roars and the hippo chomps on the two-car Sodor Zoo Cars. Thomas Wooden Railway vehicles, track and destinations are not compatible with Take Along Thomas items.",
  11 => "Baby Aspen's \"Hug-alot-amus\" hooded robe embraces infants with terrycloth coziness and hippo-size cuteness. Features and facts: Lavender terry robe with white cuffs, two terry ties in front, a hood with two smiling, white hippo teeth, appliqued gray eyes and hippo ears. Bottom of robe has a hippo's tail. Sharks can be personalized with baby's inital for an additional cost. Machine-wash and dry (low). Size 0-6 months.",
  12 => "Stickerslug 5 inch pink cartoon hippo vinyl decal sticker. This frustration-free cartoon hippo has an endless list of places you can use this decal to liven up your world. Whether you are new to decal stickers or a professional, it could not be simpler with our products. Included with your purchase of this cartoon hippo decal is our easy to follow Stickerslug instructional booklet to guide those who may be new to installing decals. If you are installing your pink cartoon hippo outdoors, select our high quality gloss finish material, and select our premium matte finish vinyl material for your indoor installations.",
  13 => 'Race Car Bouncing Balls. Assorted styles. Rubber. 1 1/4" (35mm)',
  14 => "From the original My Pillow Pets, this Extra Cuddly Hungery Hippo is made of soft Lavendar plush fabric. Open the velcro closure and use as a pillow. Close the velcro closure and you have the softest pet ever. This is part of the Original My Pillow Pets, as advertised on Nickelodeon, Discovery Kids, TV Land.",
}

PRODUCT_PIC_URLS = {
  0 => "hungry_hippos_image.jpg",
  1 => "hiphopopotamus_board_game_image.jpg",
  2 => "fotc.jpg",
  3 => "keep_calm_thermos.jpg",
  4 => "aurora_world_aurora_plush_12in_hippo.jpg",
  5 => "childrens_hippo_animal_chair.jpg",
  6 => "design_toscano_huey_the_hippo_garden_statue.jpg",
  7 => "hippo_door_mat.jpg",
  8 => "R&M_hippo_4in_cookie_cutter_in_durable_economical_tinplated_steel.jpg",
  9 => "hippos_attractives_salt_pepper_shaker_made_of_ceramic.jpg",
  10 => "thomas_and_friends_wooden_railway_zoo_car.jpg",
  11 => "Baby_Aspen_Hug-alot-amus_Hooded_Hippo_Robe_Purple_0-6_Months.jpg",
  12 => "Cartoon_Hippo_Vinyl_Decal_Sticker_for_wall_or_car_pink_5inch.jpg",
  13 => "Race_Car_Bouncing_Balls_1_dozen-Bulk_Toy.jpg",
  14 => "My_Pillow_Pets_Hungry_Hippo-Large_Lavender.jpg",
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
    "animals",
    "furniture",
    "resin",
    "hand painted",
    "patio",
    "lawn",
    "chair",
    "sculpture",
    "outdoor"
  ],
  7 => [
    "hippo",
    "hippopotamus",
    "animals",
    "outdoor",
    "coir",
    "pvc",
    "decoration",
    "home deco",
    "interior design",
    "carpet",
    "rugs"
  ],
  8 => [
    "hippo",
    "hippopotamus",
    "animals",
    "steel",
    "baking",
    "baked goods",
    "cooking",
    "cookware",
    "kitchen",
    "dining",
    "utensils",
    "cookie"
  ],
  9 => [
    "hippo",
    "hippopotamus",
    "animals",
    "ceramic",
    "dining",
    "kitchen",
    "utensils",
    "seasonings",
    "spices",
    "novelty",
    "home deco",
    "decoration",
    "cooking"
  ],
  10 => [
    "hippo",
    "hippopotamus",
    "animals",
    "trains",
    "automobiles",
    "locomotives",
    "vehicles",
    "zoo",
    "wheels",
    "lion",
    "track",
    "kids",
    "children",
    "toys",
    "games",
    "models",
    "sets"
  ],
  11 => [
    "hippo",
    "hippopotamus",
    "animals",
    "baby",
    "babies",
    "toddlers",
    "clothing",
    "apparel",
    "robe",
    "bathrobe",
    "novelty",
    "nursery",
    "hood",
    "plush",
    "terry",
    "tail",
    "machine wash",
    "machine dry"
  ],
  12 => [
    "hippo",
    "hippopotamus",
    "animals",
    "automotive",
    "automobiles",
    "cars",
    "vehicles",
    "stickers",
    "stationary",
    "decals",
    "decorations"
  ],
  13 => [
    "hippo",
    "hippopotamus",
    "animals",
    "balls",
    "games",
    "kids",
    "children",
    "toys",
    "racecars",
    "sportscars",
    "cars",
    "stocking stuffer",
    "gifts"
  ],
  14 => [
    "hippo",
    "hippopotamus",
    "animals",
    "bedware",
    "bedding",
    "bedroom",
    "bed",
    "pillows",
    "machine wash",
    "plush",
    "stuffed",
    "toys"
  ],
}

prod_num = 0
while prod_num < PRODUCT_NAMES.length
  prod_pic = nil
  if PRODUCT_PIC_URLS[prod_num]
    prod_pic = File.open(
      File.join(
        Rails.root, "/app/assets/images/seed/#{PRODUCT_PIC_URLS[prod_num]}"
      )
    )
  end

  product = Product.find_by(
    name: PRODUCT_NAMES[prod_num],
    seller_id: PRODUCT_SELLER_IDS[prod_num],
    description: PRODUCT_DESCRIPTIONS[prod_num]
  )
  if product
    product.update_attributes!({
      name: PRODUCT_NAMES[prod_num],
      seller_id: PRODUCT_SELLER_IDS[prod_num],
      original_price: PRODUCT_ORIGINAL_PRICES[prod_num],
      sale_price: PRODUCT_SALE_PRICES[prod_num],
      quantity: PRODUCT_QUANTITIES[prod_num],
      description: PRODUCT_DESCRIPTIONS[prod_num],
      picture: prod_pic
    })
  else
    product = Product.create!({
      name: PRODUCT_NAMES[prod_num],
      seller_id: PRODUCT_SELLER_IDS[prod_num],
      original_price: PRODUCT_ORIGINAL_PRICES[prod_num],
      sale_price: PRODUCT_SALE_PRICES[prod_num],
      quantity: PRODUCT_QUANTITIES[prod_num],
      description: PRODUCT_DESCRIPTIONS[prod_num],
      picture: prod_pic
    })
  end

  PRODUCT_TAG_NAMES[prod_num].each do |tag_name|
    tag = Tag.find_by(name: tag_name)
    if tag && !product.tags.include?(tag)
      product.tags << tag
    elsif tag.nil?
      product.tags.create!({name: tag_name})
    end
  end

  prod_num += 1
end
