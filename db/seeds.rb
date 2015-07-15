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

def seed_user_id(user_emails_key)
  User.find_by(email: "#{USER_EMAILS[user_emails_key]}@hippolyta.us").id
end

PRODUCT_NAMES = {
  0 => "Hungry Hungry Hippos",
  1 => "Hiphopopotamus Board Games",
  2 => "Hiphopopotamus vs. Rhymenoceros [feat. Rhymenocerous and the
        Hiphopopotamus]",
  3 => "Purple 16oz Insulated Stainless Steel Travel Mug Z431 Keep Calm and Love
        Hippos",
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
  15 => "Mini Bobble Head Hippo",
  16 => "Carter's Animals Collection 4 Piece Crib Set",
  17 => "Carter's Animals Collection Musical Mobile",
  18 => "The Hiccupotamus, Hardcover – September 1, 2009",
  19 => "Boston Warehouse Stainless Steel and Blue Hippo Mini Stapler",
  20 => "Mobile Phone Green Plastic Cartoon Hippo Shape Stand Holder",
  21 => "EMTEC M324 Animal Series 4 GB USB 2.0 Flash Drive, Hippo (EKMMD4GM324)",
  22 => "Deco Breeze Hippo Figurine Fan",
  23 => "Jojo's Boutique Hippo Charm Antique Silver for Snake Charm Bracelet",
  24 => "Bath Accessory Set - Pouf, Mitt & Mesh Carry Bag - Purple Hippo",
  25 => "Kidzuu Soft Sole Baby Infant Leather Crib Shoes Navy Red Hippo",
  26 => "Momo Baby Infant/Toddler Hip Hippo Navy Soft Sole Leather Shoes",
  27 => "The Mountain Men's Hippo Head T-shirt",
  28 => 'Kinder "Happy Hippo" Cocoa Cream Biscuits : Pack of 5 Biscuits',
}

PRODUCT_SELLER_IDS = {
  0 => seed_user_id(0),
  1 => seed_user_id(0),
  2 => seed_user_id(0),
  3 => seed_user_id(0),
  4 => seed_user_id(0),
  5 => seed_user_id(1),
  6 => seed_user_id(1),
  7 => seed_user_id(1),
  8 => seed_user_id(1),
  9 => seed_user_id(1),
  10 => seed_user_id(2),
  11 => seed_user_id(2),
  12 => seed_user_id(2),
  13 => seed_user_id(2),
  14 => seed_user_id(2),
  15 => seed_user_id(3),
  16 => seed_user_id(3),
  17 => seed_user_id(3),
  18 => seed_user_id(3),
  19 => seed_user_id(3),
  20 => seed_user_id(4),
  21 => seed_user_id(4),
  22 => seed_user_id(4),
  23 => seed_user_id(4),
  24 => seed_user_id(4),
  25 => seed_user_id(0),
  26 => seed_user_id(0),
  27 => seed_user_id(0),
  28 => seed_user_id(0),
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
  15 => 14.99,
  16 => 175.99,
  17 => 57.99,
  18 => nil,
  19 => nil,
  20 => nil,
  21 => 30.99,
  22 => 500.00,
  23 => nil,
  24 => 11.99,
  25 => 14.99,
  26 => nil,
  27 => 30.99,
  28 => nil,
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
  15 => 10.99,
  16 => 149.99,
  17 => 49.99,
  18 => 7.79,
  19 => 11.44,
  20 => 5.22,
  21 => 10.99,
  22 => 249.95,
  23 => 5.70,
  24 => 7.99,
  25 => 9.99,
  26 => 25.00,
  27 => 9.30,
  28 => 5.49,
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
  15 => 1,
  16 => 100,
  17 => 12,
  18 => 100,
  19 => 3,
  20 => 100,
  21 => 14,
  22 => 1,
  23 => 5,
  24 => 100,
  25 => 100,
  26 => 100,
  27 => 100,
  28 => 100,
}

PRODUCT_DESCRIPTIONS = {
  0 => "You’ll have a chompin’ good time with Hungry Hippo and his pals. Be
        ready to join in the feeding frenzy when you release all the marbles
        onto the game base, because all the hippos will be chomping and your
        hippo will need to move fast. If it chomps the golden marble, you win.",
  1 => "The early counting game. Hop and count your way across the river but
        don't get caught by the Hippopotamus. Teach counting from 1-20, simple
        addition, subtraction and number sequencing. Contains floor mat,
        inflatable die and game guide. For 1 to 4 players. For ages 4 to 6
        years.",
  2 => "As heard on the HBO show, and from the album, Flight Of The Conchords.",
  3 => "16 oz. travel mug with stainless steel outer wall, color accents, and
        matching insulated liner. Double wall plastic inner liner insulation.
        Smooth curved body for easy grab-N-go handling. Plastic lid with a spill
        prevention slide lock.",
  4 => "Realistic Styling. Wonderful Gift Item. Fine Plush Fabric. Premier
        manufacturer of gift plush. Soft and cuddly.",
  5 => "WOW! This adorable Hippo chair is the perfect gift for any baby to a
        young child. It's cute design and super soft material creates a
        multi-use piece. It is first and foremost a cozy chair, but it is also a
        giant stuffed animal, and it will certainly brighten the decor of any
        room. It is the perfect gift for your children, grandchildren, or any
        other adorable young one you know. It is irresistibly soft and designed
        to function as a chair, but it is durable enough for a childhood of
        unlimited HUGS and CUDDLES",
  6 => "Guests won’t know what to expect when they notice the Huey the Hippo
        Garden Sculpture popping his head up from your garden, patio, or yard.
        This whimsical sculpture will liven up any setting and is perfect
        indoors or out. It’s made of cast resin and hand painted in striking
        detail.",
  7 => 'Provide a "hip" and hefty hello at the front door with the Droog Hippo
        Door Mat. Designed by Ed Annink, the Hippo Door Mat has an unmistakable
        and playful shape taken from a copyright-free Gerd Arntz pictogram and
        made out of a durable and natural-looking combination of coir and PVC.',
  8 => "CybrTrayd-R&M heavy-duty tinplate steel cookie cutters are strong and
        built to hold their shapes. However, they are not dishwasher-safe and
        should be hand washed in warm, soapy water and towel dried.",
  9 => 'Salt & Pepper Shakers Set. Size: ~3" - 4". Not Dishwasher or Microware
        Safe. Made of High Quaility Ceramic. Not Recommended For Children Under
        12. 100% Licensed Product.',
  10 => "The Island of Sodor is alive with jungle animals, as the Zoo Cars are
         transporting lions and hippos! The lion roars and the hippo chomps on
         the two-car Sodor Zoo Cars. Thomas Wooden Railway vehicles, track and
         destinations are not compatible with Take Along Thomas items.",
  11 => "Baby Aspen's \"Hug-alot-amus\" hooded robe embraces infants with
         terrycloth coziness and hippo-size cuteness. Features and facts:
         Lavender terry robe with white cuffs, two terry ties in front, a hood
         with two smiling, white hippo teeth, appliqued gray eyes and hippo
         ears. Bottom of robe has a hippo's tail. Sharks can be personalized
         with baby's inital for an additional cost. Machine-wash and dry (low).
         Size 0-6 months.",
  12 => "Stickerslug 5 inch pink cartoon hippo vinyl decal sticker. This
         frustration-free cartoon hippo has an endless list of places you can
         use this decal to liven up your world. Whether you are new to decal
         stickers or a professional, it could not be simpler with our products.
         Included with your purchase of this cartoon hippo decal is our easy to
         follow Stickerslug instructional booklet to guide those who may be new
         to installing decals. If you are installing your pink cartoon hippo
         outdoors, select our high quality gloss finish material, and select our
         premium matte finish vinyl material for your indoor installations.",
  13 => 'Race Car Bouncing Balls. Assorted styles. Rubber. 1 1/4" (35mm)',
  14 => "From the original My Pillow Pets, this Extra Cuddly Hungery Hippo is
         made of soft Lavendar plush fabric. Open the velcro closure and use as
         a pillow. Close the velcro closure and you have the softest pet ever.
         This is part of the Original My Pillow Pets, as advertised on
         Nickelodeon, Discovery Kids, TV Land.",
  15 => 'This unique hand crafted collectible?bobble head?is made with high
         quality resin. It is hand-painted.? You will be amazed by its fine
         details. This is a "must have" collectible for?animal lovers. So buy it
         now while supply last.??This cute bobble head can be placed in the
         car.? While the car is moving, so is this cute little bobble head.',
  16 => "Carter's animals collection 4 piece crib set animals collection set
         includes: comforter, dust ruffle, sheet, and nursery organizer. Set the
         stage for sweet safari dreams, complete with happy hippos, elephants,
         turtles, and giraffes in a stylish combination of greys, greens, and
         yellows. Features an appliqued quilt trimmed in polka-dot edging, crib
         sheet adorned with adorable animals, darling green and white dust
         ruffle, and wild-animal print diaper stacker. Coordinates with a full
         line of carters animal collection nursery decor and bedding.",
  17 => "Carter's animals collection musical mobile. This musical mobile will
         help soothe your little one to sleep, gently spinning while playing
         brahms lullaby. Elegant elephants and adorable turtles spin beneath a
         ruffled canopy as a curious giraffe looks on. Coordinates with a full
         line of carter's animals collection nursery bedding and room decor.",
  18 => "A hippopotamus with a bad case of the hiccups. Age Range: 1 - 2 years.
         Hardcover: 32 pages. Language: English.",
  19 => "Blue Novelty Hippopotamus Stapler. Small enough to travel with.
         Smooth round edges.  Make your office, workplace, or school more fun!",
  20 => "Exquisite design with cartoon hippo shape, lovable and chic.This
         Plastic Stand Holder is ideal for displaying mobile phone, Mp4, Mp5,
         etc.Nice gift for your friends, also adorn your tabletop.With
         self-adhesive tape on the base, placing it on the desk firmly.",
  21 => "In a world full of bland, boring flash drives, EMTEC stands out from
         the crowd. In today's digital world, consumers are creative and demand
         advanced technologies to express themselves. EMTEC answers the call by
         providing a wide range of USB flash drives, each one perfect for
         storing, transporting and sharing your presentations, documents,
         photos, music files and more. The EMTEC Animal USB Flash Drive series
         features a set of charming animal characters carefully crafted from
         quality rubber materials.",
  22 => "Let this Hippo Shaped Decorative Figurine Fan brighten your day while
         it keeps you cool. With its decorative appeal, a Figurine Fan can
         easily become a permanent part of any desk, vanity, bedroom, kitchen,
         or bathroom decor.",
  23 => "Fits snake bracelets or a neckalce you are making. Quantity: 1 Bead.
         Material: Base Metal Silver Plated Antique Finish.",
  24 => "Essential Design Bath Accessory Set - Pouf, Mitt & Mesh Carry Bag.",
  25 => "Outfit your little one with these absolutely charming soft sole infant
         baby shoes. These comfortable leather shoes are great for the little
         ones, and convenient for the parents. Great for both indoors and
         outdoors. Machine washable. Leather conditioner works well on it.",
  26 => "Allowing your baby to go barefoot helps the foot to grow normally and
         to develop its musculature and strength. Momo Baby footwear is
         carefully handcrafted and designed to provide the protection from
         rough surfaces and dirty floors, while providing the health benefits of
         being barefoot. Momo Baby's entire line of footwear has been awarded
         the American Podiatric Medical Association's prestigious Seal of
         Acceptance which recognizes products which have been found beneficial
         and significant value to foot health.",
  27 => "Hand dyed shirt featuring a screen print graphic of a hippo head on a
         preshrunk, 100 percent cotton shirt dyed and printed by the mountain
         which uses only inks and dyes to bring you a durable and comfortable
         t-shirt",
  28 => "Kinder Chocolate is not complete without Kinder Happy Hippo which is a
         cookie-wafer bar with creamy milk and nut filling. Package contains 5
         Kinder Happy Hippo Cacao bars.",
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
  15 => "mini_bobble_head_hippo.jpg",
  16 => "Carters_Animals_Collection_4_Piece_Crib_Set.jpg",
  17 => "Carters_Animals_Collection_Musical_Mobile.jpg",
  18 => "The_Hiccupotamus.jpg",
  19 => "Boston_Warehouse_Stainless_Steel_and_Blue_Hippo_Mini_Stapler.jpg",
  20 => "Mobile_Phone_Green_Plastic_Cartoon_Hippo_Shape_Stand_Holder.jpg",
  21 => "EMTEC_M324_Animal_Series_4_GB_USB_2_Flash_Drive_Hippo_EKMMD4GM324.jpg",
  22 => "Deco_Breeze_Hippo_Figurine_Fan.jpg",
  23 => "Jojos_Boutique_Hippo_Charm_Antique_Silver_for_Snake_Charm_Bracelet.jpg",
  24 => "Bath_Accessory_Set-Pouf_Mitt_&_Mesh_Carry_Bag_Purple_Hippo.jpg",
  25 => "Kidzuu_Soft_Sole_Baby_Infant_Leather_Crib_Shoes_Navy_Red_Hippo.jpg",
  26 => "Momo_Baby_InfantToddler_Hip_Hippo_Navy_Soft_Sole_Leather_Shoes.jpg",
  27 => "The_Mountain_Mens_Hippo_Head_T-shirt.jpg",
  28 => "Kinder_Happy_Hippo_Cocoa_Cream_Biscuits_Pack_of_5_Biscuits.jpg",
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
  15 => [
    "hippo",
    "hippopotamus",
    "animals",
    "toys",
    "novelty",
    "bobblehead",
    "decoration",
    "collectible",
    "resin",
    "bobble",
    "hand painted",
    "art",
    "trinkets",
    "cars"
  ],
  16 => [
    "hippo",
    "hippopotamus",
    "animals",
    "sheets",
    "bedding",
    "bed",
    "crib",
    "baby",
    "toddler",
    "infant",
    "cotton",
    "machine wash",
    "sets",
    "comforter",
    "mobile"
  ],
  17 => [
    "hippo",
    "hippopotamus",
    "animals",
    "crib",
    "baby",
    "toddler",
    "infant",
    "polyester",
    "music",
    "mobile",
    "toys",
    "gifts",
    "sets"
  ],
  18 => [
    "hippo",
    "hippopotamus",
    "animals",
    "books",
    "hardcover",
    "kids",
    "children",
    "reading",
    "hiccups"
  ],
  19 => [
    "hippo",
    "hippopotamus",
    "animals",
    "office supplies",
    "workplace",
    "school supplies",
    "staples",
    "novelty",
    "gifts"
  ],
  20 => [
    "hippo",
    "hippopotamus",
    "animals",
    "cell phone",
    "mobile phone",
    "gifts",
    "toys",
    "plastic",
    "phone case",
    "electronics",
    "technology"
  ],
  21 => [
    "hippo",
    "hippopotamus",
    "animals",
    "electronics",
    "technology",
    "usb",
    "memory stick",
    "hardware",
    "portable",
    "flash drive",
    "computers"
  ],
  22 => [
    "hippo",
    "hippopotamus",
    "animals",
    "appliances",
    "home deco",
    "decoration",
    "art",
    "sculpture",
    "statue",
    "fan",
    "cast metal",
    "cooling",
    "air conditioning",
    "interior design"
  ],
  23 => [
    "hippo",
    "hippopotamus",
    "animals",
    "jewelry",
    "silver plated",
    "antique",
    "bracelet",
    "charm",
    "gifts",
    "crafts",
    "crafting",
    "craft",
    "art",
    "beading",
    "sewing"
  ],
  24 => [
    "hippo",
    "hippopotamus",
    "animals",
    "bath",
    "toiletries",
    "loofah",
    "makeup",
    "cosmetics",
    "skin care"
  ],
  25 => [
    "hippo",
    "hippopotamus",
    "animals",
    "shoes",
    "footware",
    "clothes",
    "clothing",
    "apparel",
    "garments",
    "baby",
    "infant",
    "toddler",
    "leather",
    "suede"
  ],
  26 => [
    "hippo",
    "hippopotamus",
    "animals",
    "shoes",
    "footware",
    "clothes",
    "clothing",
    "apparel",
    "garments",
    "baby",
    "infant",
    "toddler",
    "leather",
    "suede"
  ],
  27 => [
    "hippo",
    "hippopotamus",
    "animals",
    "clothes",
    "clothing",
    "apparel",
    "garments",
    "shirt",
    "t-shirt",
    "dyed",
    "cotton",
    "machine wash",
    "machine dry",
    "preshrunk",
    "art"
  ],
  28 => [
    "hippo",
    "hippopotamus",
    "animals",
    "chocolate",
    "candy",
    "cookies",
    "snacks",
    "German",
    "food",
    "perishables",
    "edible"
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

def seed_product_id(product_names_key)
  Product.find_by(name: PRODUCT_NAMES[product_names_key]).id
end

REVIEW_TEXTS = {
  0 => "Perfect! 5 year old daughter loves this game. Wish it came with extra
        marbles as of course we have already lost one.",
  1 => "Probably their best song recorded.\n
        \"Be more constructive with your feedback.\"\n
        Okay.\n
        Nice rhymes, great video, the song is awesome. If you like parody
        hip-hop, you'll like this.",
  2 => "So, I'm not sure how to write a review on a stuffed animal. I ordered it
        for my girlfriend for her birthday. She is a college student in a zoo
        program and LOVES hippos. As far as a cute rating, I would give it 5
        stars. Cuddly rating, another 5 stars. The smile it put on her face when
        I presented it to her was deserving of 100 stars. She absolutely loved
        it. It is very soft to the touch and seems to be of good quality. There
        were no problems with it at all. Overall, whether for a child or a hippo
        fanatic girlfriend, this is a great stuffed animal. :]",
  3 => "My husband is the kind of guy who shakes the box and guesses the gift.
        Well, he didn't guess THIS one! He wanted a hippopotamus for
        Christmas... and only a hippopotamus would do. Maybe next year I can get
        him the rest of the body... :-)\n
        Huey is adorable as far as hippos go. Very nice quality. My husband has
        him (or what's left of him... let me not get \"ahead\" of myself) on a
        credenza near his desk. You can't help but smile when you look at this
        jolly guy.\n
        We were happy that floating dung was not included.\n
        5 STARS!",
  4 => "I love hippos, they're my favorite animal! So, to be able to make
        cookies in their shape is wonderful! Love this!",
  5 => "I got this for my 1 year old great grandson as the discretion said it
        was for age 1 to 4 years. This is to small for a 1 year old",
  6 => nil,
  7 => "I purchased the purple hippo as a gift for my niece's birthday present.
        Pillow Pets are all the rage in her elementary school. She is 7. She was
        so happy to receive this gift. I was please with with product, I think
        these are clever toys and I like the dual use. Very soft and cuddly. If
        you are looking to please a young person in your life consider
        purchasing one. A perfect gift.",
  8 => "As pictured, fast delivery, happy with quality",
  9 => "What happens when a purple rotund hippontimus has hiccups so fearce they
        blast everything and everyone around him into flight? Humor, that's
        what.\n\n
        Author and illustrator Aaron Zenz presents a whimsical rhyme of epic
        proportions in his first children's picture book \"The Hiccupontamus.\"
        Beautifully illustrated, and in a Dr. Suess-like manner, the story
        creates many words that would send Daniel Webster reeling.\n\n
        \"There was a hippopotamus\n\n
        Who hiccupped quite-a-lotamus\n\n
        And every time he got'emus\n\n
        He'd fall upon his bottomus.\"\n\n
        Zenz rendered all of the humorous cartoon illustrations using colored
        pencils, using 119 in all. The Spring Lake, Michigan resident holds an
        art degree from Hillsdale College. \"The Hiccupotamus\" took eight years
        to complete and is published by Chicago-based Dogs In Hats Children's
        Publishing.\n\n
        The printing quality of the book is ultra-professional and brings out
        Zenz' pressure-applied pencils to vibrant life. It is often a
        competitive page quandary for the reader which to love most; the story
        or the drawings. The chemistry between text and pictures is remarkable,
        and rivals the best children's books ever published.\n\n
        Aaron Zenz enjoys communicating with kids of all ages through art
        lessons to home schooled children and Sunday School classes. His
        outreach to children can only grow with this jewel of a book.",
  10 => "current phones are too large for this but we have found other uses for
         it: temporarily holding gift cards, or business cards, etc.",
  11 => nil,
  12 => nil,
  13 => "Super cute and soft. Love them.",
  14 => "Who has time to worry about world domination when there are Happy
         Hippos to devour? Even the most hardened dictator among us cannot
         withstand the delicate chocolate flakes that surround the light crisp
         of the sugar wafer. The smooth chocolate filling is like a mind eraser;
         gone are thoughts of insurgency planning, citizen mind control, and
         world domination. Yesterday was the day to punish your enemies, today
         is the day to eat more Happy Hippos.",
  15 => nil,
  16 => nil,
  17 => "Some on here have complained about it being cheap, or warped to not sit
         flat. READ THE INSTRUCTIONS! The reason it may not sit flat is because
         you have the cap on the bottom still where the balls are supposed to be
         stored. if you remove that to get the balls out the thing sits perfectly
         flat. Also having it a bit wobbly can be fun causing the balls to shift
         around more.",
  18 => "Flight of the Conchords is a pretty good group. I love all of their
         songs. This is one of my favorites.",
  19 => "Got this for a friend who is in her sixties, and loves hippos. She
         liked it, but gave it back as the fur was not like a real hippo's fur.
         I don't believe hippos have fur, but whatever. I gave it to my two year
         old grandson, and he could care less about the authenticity of the fur.
         It is soft, and cute, and may I say cuddly ?? It seems well put
         together, but I suspect any 2 year old boy worth his salt can
         eventually destroy it. If treated with a minimum of care, I would guess
         it would last an extended period. he is happy either way.",
  20 => "Huey the Hippo is awesome! Very realistic & unique. I purchased him for
         an officemate that is retiring who lived among the hippos in Africa for
         a few years while conducting research. It is well made & will bring
         many favorable comments for those that see it.",
  21 => "This was a gift for my mother who collects Hippos, she loved it, and I
         am sure we will now be getting Hippo shaped cookies all the time now
         :)",
  22 => "At current price (13$), these two cars is a good deal. I got this
         because of hippo car and it is great. My son immediately started to
         play with these cars...there is always a need for cool cars that
         engines can pull. Note that hippo and the green part of the car is made
         of plastic. The lion car is almost entirely plastic except from the
         very bottom part to which wheels are attached. Also, the lion car is
         quite bulky. I like hippo car more than lion car...but my son likes
         both. All in all, nice cars if you don't mind the plastic.",
  23 => nil,
  24 => "I ordered this for Christmas and when it came (from Rosy Deals) I
         discovered that it was a Pillow Pal and not an authentic Pillow Pet at
         all. Very disappointed!!! I had to call Amazon and re-order a different
         one.",
  25 => "Cute for cutie on his way! I'm happy that I got one. Looks great!",
  26 => "We really enjoyed the sillyness of this story. It had great
         illustrations. We thought the had lots of personality. Will look for
         more stories like this one.",
  27 => "Too light weight to hold my phone with out falling over... I wanted to
         use with out actually sticking it to my desk but will have to glue it
         down if I want to use it.",
  28 => nil,
  29 => nil,
  30 => "My 11 month old cruiser still has baby feet so regular shoes don't stay
         on, but these stay on and he can't take them off. I use them at daycare
         because they take him outside and there is dirt and grass.",
  31 => "Happy hippos are one of the best cookie/candies I have ever had. They
         are a tad expensive but they are well worth the price. With a nice
         crunchy outside and a soft and a hazelnut chocolate inside you will be
         in heaven of tasty food. If your looking for something for a friend or
         just some kind of new snack food I highly recommend Happy Hippos.",
  32 => nil,
  33 => nil,
  34 => "One of the few games older kids (and men) seem to actually enjoy
         playing with the little ones. Fairly sturdy, considering the rough
         play it endures; it will be fun for as long as it lasts!",
  35 => nil,
  36 => "I purchased this hippo for me because I love to collect stuffed
         animals. I'm just a big baby. I love things that I can squeeze, hug,
         and kiss! This is a magnificent product.",
  37 => "Huey arrived in excellent condition. He now resides in the bushes next
         to a swimming pool, ready to go for a dip. A few swimming guest jumped
         in surprise and others just chuckled because he looks so real and cute.
         I think Huey found a good home.",
  38 => "It seems like it will be fairly durable. I have not tried it out yet
         since it was a gift for my little sister. Made in China for any who
         might be concerned.",
  39 => "This an very cute item. The sliding gate on the car roars like a lion
         and the hippo's mouth opens and closes. So cute. It matches perfectly
         to my niece's train set.",
  40 => nil,
  41 => "My little one loves this thing so much! She kept saying 'so soft' and
         hugging it lol, I will buy again after it tears up or washes apart. It
         was expensive.",
  42 => "Pictures do not do this set justice. The detail and the quality are
         excellent.",
  43 => "Short, sweet and funny. It makes you laugh just because it is so
         simple. Great for kids learning to read, or to be read to kids.",
  44 => "I should've paid closer attention to the product details. It's very
         cute for a hippo collector like myself, but my phone doesn't fit in
         this holder. It will hold an old fashioned flip phone.",
  45 => nil,
  46 => nil,
  47 => "My little grandson is on the chubby side, so these are tight around his
         little ankles. He can not wear socks with them. However, this does not
         take away from these fantastic shoes. They are soft and protective.
         They stay on and stay put. No more lost shoes in the mall, the
         restaurant, etc, etc. Glad I purchased them.",
  48 => "I love these little guys. They are highly addictive and one is just
         never enough. It has a perfect blend of crispy wafer, cocoa, and milk.
         It is like a party in your mouth. Yum....yum! Enjoy some!!!",
  49 => nil,
  50 => nil,
  51 => "I remember having this game when I was a kid and it seemed to be much more durable back then. I ordered this for my nearly 4 year old daughter because I thought she'd have a fun time playing with it. The game itself is still fun but I found a few issues:\n
         1) game doesn't sit flat on the table - plastic is thin and warped\n
         2) you have to snap the hippos into the square board. I could see these getting broken easily and they don't exactly fit snugly anyway. The hippo mouths keep getting stuck open or pushed out (won't spring back after gobbling the marbles).\n
         3) the \"marbles\" are very cheap, lightweight plastic. Back in the 'olden days,' the marbles may have been plastic but they were a more dense, heavy plastic at least!\n\n
         So I'm kind of torn. I have good memories of the game and my daughter does still like this but I am disappointed in the quality and feel that it will end up broken / unusable sooner rather than later.",
  52 => nil,
  53 => "Somehow the picture on the computer looks cuter than the real thing but
         still adorable. Wish the eyes were just a little bigger but still glad
         I got it.",
  54 => "Adorable. Gorgeous. One of the better looking hippos. Huey arrived
         quickly and was reasonably priced. The only draw back is his \"skin\".
         It chipped a bit already. But he's so cute it doesn't matter.",
  55 => "This was supposed to be a gift for my daughter's kindergarten teacher,
         but it broke as soon as we opened the package. It's very, very thin
         tinplated steel.",
  56 => "These are absolutely adorable. I like that they are not actually one of
         the characters & offer something different. The hippo mouth chomps open
         & shut as it rolls along & the lion roars when you move the little door
         on the side. The side says \"SODOR ZOO\" so it is associated w/
         Thomas.",
  57 => nil,
  58 => "I had been looking for the Hippo pet for a while and couldn't find it
         anywhere but Amazon. It was exactly what we wanted.",
  59 => "The set is adorable. It looks great in our jungle themed nursery. The
         quilt is pretty soft...the diaper stacker is also soft, stacks a good
         amount of diapers, and is easy to use. The fitted sheet is a little bit
         rough, but more than just the matching sheet is used anyway...I have
         other sheets that the baby will be using as well.\n
         I am very upset with the dust ruffle...I used the hand wash cycle (it
         calls for gentle cycle) the whole bedding set and put everything in the
         dryer on tumble dry low for a brief amount of time (like the directions
         say). I would not recommend following the directions. I was very
         disappointed that the top of the dust ruffle (part that goes under the
         mattress) produced holes. If I would have just air-dryed the dust
         ruffle everything would be fine. Just bummed about the quality that it
         didn't make it though the first washing.\n\n
         Again, overall an inexpensive adorable looking bedding set. Obviously,
         if we want high quality you'll need to spend more.",
  60 => "The Hiccupotamus by Aaron Zenz is a vibrant picture book filled with a
         sense of humor that bounces off of the pages along with the colors. A
         hippo has a severe case of the hiccups and accidentally angers an
           elephant by hiccuping nearby. She chases after him and on the way
           they encounter a whole group of animals bothered by his hiccups. The
           text is done in a rollicking rhyme that will appeal to toddlers and
           preschoolers as well as the adults reading and listening. This book
           is quite simply a lot of fun. I would save it to pull out and
           brighten a rainy day.\n\n
           For adults, Zenz's humor continues onto the final page of the book
           with the Cast Bios. My favorite is that \"the part of the buffalo was
           played by a groundsquirrel named Arlo.\" For librarians, check out
           the subject headings, all rights reserved statement and other funny
           bits on the copyright page. Laugh-out-loud funny!",
  61 => "I needed a holder that I could sit my cellphone on next to me at the
         computer and see when I was getting a call or other notice. My
         cellphone cover is this same shade of green so it looks like it was
         made for my phone - just so cute!!",
  62 => nil,
  63 => nil,
  64 => "Fits well but the opening seems a little bit tight. My son has thick
         ankles and feet the opening is cutting off his circulation and leaves
         marks around his ankles. Not recommended if your baby has thicker
         legs",
  65 => "I just tried my first happy hippo a few days ago, and now I don't know
         how I have gone this long without it. The name and shape got me to buy
         one. I bought some of the cocoa ones at the Kris Kindle Mart in
         Chicago. The outside is a perfect wafer crunch. The inside has a smooth
         chocolate filling, but it is not completely filled. It has just enough
         to balance the crunch. The shape, besides being a hippo, makes it a
         three bite goodie. The wafer doesn't crumble when you bite into it, and
         the filling isn't oozing out. The perfect candy.",
  66 => nil,
  67 => nil,
  68 => "The two stars are for the game itself. Cute game to play with the kids
         ages 6 and 4. I had this game as a kid so naturally I thought it would
         be great! But I am disappointed that the game has to be disassemble
         after each use. This is time consuming for a busy mother. To assemble
         and disassemble each use is ludicrous. We own plenty of games and due
         to this I don't think we will play this as often. It only takes a
         couple of minutes to assemble but it's just not worth it. I'd stick to
         my hi oh cherry! If time is on your side then I say it's a overall, ok
         game.",
  69 => nil,
  70 => "Very plush and cute. Shipping was free and fairly quick. Ordered
         several to use as props in a dance one of our younger dance classes is
         doing. They love the hippos!",
  71 => "It's nice, one of the down sides is the color....same as dirt...I need
         to work with it to make it more noticeable. But I like it.",
  72 => "I ordered this particular one as it looked to have a nice big middle. I
         got a very skinny hippo that is not at all like the one pictured.
         Completely different face features and feet. Will be much harder to
         make but I'm on deadline for a project and have to use it.",
  73 => "We love these cars, the lion car opens & the lion roars. Hippo moves
         his mouth up & down as the car rolls. The price on here is a little
         steep. We bought these at Marshalls for $12.99 for both.",
  74 => nil,
  75 => "Different from any other, this pillow pet is no typical stuffed animal.
         I have been through countless stuffed dogs, bears, cats and more; yet
         none compare to my beloved hippo. Many Christmases ago, Hippy came into
         my life wrapped clumsily beneath the lit tree. It was love at first
         sight as I squeezed my fluffy friend close to my heart. From that
         moment on we were inseparable - well, except for the time I spent with
         other humans, homework and sports. Hippy was indeed my partner in
         crime, or more like my partner in watching innumerable movies, studying
         and sneaking food into my room. He was always there for me, the only
         stuffed friend I'd ever need. Every night as I headed to bed, I knew
         his soft, fuzzy self would await me. I can't even begin to think what I
         would have done during a terrifying storm without my thunder buddy. I
         could depend on Hippy to let me hide under his silky, purple belly for
         the loudest cracks of thunder. After a while of owning my stuffed
         friend, I refused to wash him for the mere chance that we wouldn't
         return the same. I was mortified when my mother decided it was time for
         a swim in the washing machine without telling me. I sighed of relief
         when he returned just as cushiony as before.\n\n
         When it was time to move on to college, you bet Hippy came along with
         me, just as excited for our new surroundings. I was fortunate to have a
         piece of home to get me through such a transition in my life. College
         can be a lonely place, you know, but lucky for me I had my shaggy
         friend to rely on. The few nights I struggled to get to sleep were
         spent clung to my Hippy instead of counting sheep. Many may think that
         continuing to sleep with a stuffed animal in college is considered
         childish, but my response would be: Not only is this hippo my cuddle
         buddy, but he's a pillow - how multifaceted my friend is! There is no
         worse feeling than those long, cold nights when Hippy would fall from
         my lofted bed onto the floor and I was faced with the difficult
         decision to sleep solo or climb down from this zenith of a bed to
         retrieve him. For the times I felt homesick, just seeing Hippy's
         gigantic smile reminded me that home was still with me.\n\n
         Since college has been such a busy period, I have had less time to
         devote to my pillow friend. To prevent his loneliness, I bought him the
         perfect surprise - his own pillow pet friend, Herky! These fluffy
         creatures are best in multiples so buy as many as your heart desires.
         Obviously from my experiences, these pets are perfect for any age and
         can warm anyone's heart. I highly recommend my friend's counterparts to
         anyone looking for a quiet, but loving companion.",
  76 => "I bought it as a gift for my youngest nephew, and they are beautiful,
         really good quality, the fabric is so soft and has 3D patches, it's
         just so soft. I washed everything before giving it away, and everything
         stayed intact and perfect. We didn't use the crib skirt, so I cut the
         fabric pieces and sew 2 envelope pillow covers/shams, which we also
         washed and they also stayed perfect. It's just a beautiful set, we also
         got the wall decals.",
  77 => "Vibrant colors and fun rhymes make this a book I will be delighted to
         have my kids bring me to read over and over. (As all parents know, it's
         hard to find that kind of book!) It clips along at a nice pace, and has
         plenty for children to explore visually on each page. Definitely a
         5-star book!",
  78 => "I purchased this for use on my desk at work, it's too small &
         lightweight to hold a cell phone. It does come with double sided tape
         to apply to the hippo & wherever you want it to sit but this means you
         can't move it. I use it to hold a note pad instead & it works great for
         that purpose.",
  79 => nil,
  80 => nil,
  81 => "\"Shoes\" is a poor label for this product. These are baby moccasins.
         They have an elastic strap to keep them on their feet. They are soft
         leather and I'm slightly jealous as they don’t make a men’s 11.",
  82 => "I found these at a market during my first visit to Germany a few years
         back. I loved them so much I brought a few boxes home and people would
         always flip out over how great they taste. Being able to order them by
         the case load is a must because they go so fast! I'm docking them a
           star based on cost.",
  83 => nil,
  84 => nil,
  85 => nil,
  86 => nil,
}

REVIEW_RATINGS = {
  0 => 5,
  1 => 5,
  2 => 5,
  3 => 5,
  4 => 5,
  5 => 1,
  6 => 5,
  7 => 3,
  8 => 5,
  9 => 5,
  10 => 3,
  11 => 5,
  12 => 5,
  13 => 5,
  14 => 5,
  15 => 5,
  16 => 5,
  17 => 5,
  18 => 5,
  19 => 5,
  20 => 5,
  21 => 4,
  22 => 5,
  23 => 5,
  24 => 1,
  25 => 5,
  26 => 3,
  27 => 4,
  28 => 5,
  29 => 5,
  30 => 5,
  31 => 5,
  32 => 5,
  33 => 5,
  34 => 4,
  35 => 5,
  36 => 5,
  37 => 5,
  38 => 4,
  39 => 5,
  40 => 5,
  41 => 4,
  42 => 5,
  43 => 4,
  44 => 2,
  45 => 5,
  46 => 5,
  47 => 4,
  48 => 5,
  49 => 5,
  50 => 5,
  51 => 2,
  52 => 5,
  53 => 4,
  54 => 4,
  55 => 2,
  56 => 5,
  57 => 5,
  58 => 4,
  59 => 3,
  60 => 5,
  61 => 5,
  62 => 5,
  63 => 5,
  64 => 3,
  65 => 5,
  66 => 5,
  67 => 5,
  68 => 2,
  69 => 5,
  70 => 4,
  71 => 4,
  72 => 1,
  73 => 5,
  74 => 5,
  75 => 5,
  76 => 5,
  77 => 5,
  78 => 1,
  79 => 5,
  80 => 5,
  81 => 5,
  82 => 4,
  83 => 5,
  84 => 5,
  85 => 5,
  86 => 5,
}

REVIEW_REVIEWER_IDS = {
  0 => seed_user_id(0),
  1 => seed_user_id(0),
  2 => seed_user_id(0),
  3 => seed_user_id(0),
  4 => seed_user_id(0),
  5 => seed_user_id(0),
  6 => seed_user_id(0),
  7 => seed_user_id(0),
  8 => seed_user_id(0),
  9 => seed_user_id(0),
  10 => seed_user_id(0),
  11 => seed_user_id(0),
  12 => seed_user_id(0),
  13 => seed_user_id(0),
  14 => seed_user_id(0),
  15 => seed_user_id(0),
  16 => seed_user_id(0),
  17 => seed_user_id(1),
  18 => seed_user_id(1),
  19 => seed_user_id(1),
  20 => seed_user_id(1),
  21 => seed_user_id(1),
  22 => seed_user_id(1),
  23 => seed_user_id(1),
  24 => seed_user_id(1),
  25 => seed_user_id(1),
  26 => seed_user_id(1),
  27 => seed_user_id(1),
  28 => seed_user_id(1),
  29 => seed_user_id(1),
  30 => seed_user_id(1),
  31 => seed_user_id(1),
  32 => seed_user_id(1),
  33 => seed_user_id(1),
  34 => seed_user_id(2),
  35 => seed_user_id(2),
  36 => seed_user_id(2),
  37 => seed_user_id(2),
  38 => seed_user_id(2),
  39 => seed_user_id(2),
  40 => seed_user_id(2),
  41 => seed_user_id(2),
  42 => seed_user_id(2),
  43 => seed_user_id(2),
  44 => seed_user_id(2),
  45 => seed_user_id(2),
  46 => seed_user_id(2),
  47 => seed_user_id(2),
  48 => seed_user_id(2),
  49 => seed_user_id(2),
  50 => seed_user_id(2),
  51 => seed_user_id(3),
  52 => seed_user_id(3),
  53 => seed_user_id(3),
  54 => seed_user_id(3),
  55 => seed_user_id(3),
  56 => seed_user_id(3),
  57 => seed_user_id(3),
  58 => seed_user_id(3),
  59 => seed_user_id(3),
  60 => seed_user_id(3),
  61 => seed_user_id(3),
  62 => seed_user_id(3),
  63 => seed_user_id(3),
  64 => seed_user_id(3),
  65 => seed_user_id(3),
  66 => seed_user_id(3),
  67 => seed_user_id(3),
  68 => seed_user_id(4),
  69 => seed_user_id(4),
  70 => seed_user_id(4),
  71 => seed_user_id(4),
  72 => seed_user_id(4),
  73 => seed_user_id(4),
  74 => seed_user_id(4),
  75 => seed_user_id(4),
  76 => seed_user_id(4),
  77 => seed_user_id(4),
  78 => seed_user_id(4),
  79 => seed_user_id(4),
  80 => seed_user_id(4),
  81 => seed_user_id(4),
  82 => seed_user_id(4),
  83 => seed_user_id(4),
  84 => seed_user_id(4),
  85 => seed_user_id(4),
  86 => seed_user_id(4),
}

REVIEW_PRODUCT_IDS = {
  0 => seed_product_id(0),
  1 => seed_product_id(2),
  2 => seed_product_id(4),
  3 => seed_product_id(6),
  4 => seed_product_id(8),
  5 => seed_product_id(10),
  6 => seed_product_id(12),
  7 => seed_product_id(14),
  8 => seed_product_id(16),
  9 => seed_product_id(18),
  10 => seed_product_id(20),
  11 => seed_product_id(22),
  12 => seed_product_id(24),
  13 => seed_product_id(26),
  14 => seed_product_id(28),
  15 => seed_product_id(1),
  16 => seed_product_id(3),
  17 => seed_product_id(0),
  18 => seed_product_id(2),
  19 => seed_product_id(4),
  20 => seed_product_id(6),
  21 => seed_product_id(8),
  22 => seed_product_id(10),
  23 => seed_product_id(12),
  24 => seed_product_id(14),
  25 => seed_product_id(16),
  26 => seed_product_id(18),
  27 => seed_product_id(20),
  28 => seed_product_id(22),
  29 => seed_product_id(24),
  30 => seed_product_id(26),
  31 => seed_product_id(28),
  32 => seed_product_id(1),
  33 => seed_product_id(3),
  34 => seed_product_id(0),
  35 => seed_product_id(2),
  36 => seed_product_id(4),
  37 => seed_product_id(6),
  38 => seed_product_id(8),
  39 => seed_product_id(10),
  40 => seed_product_id(12),
  41 => seed_product_id(14),
  42 => seed_product_id(16),
  43 => seed_product_id(18),
  44 => seed_product_id(20),
  45 => seed_product_id(22),
  46 => seed_product_id(24),
  47 => seed_product_id(26),
  48 => seed_product_id(28),
  49 => seed_product_id(1),
  50 => seed_product_id(3),
  51 => seed_product_id(0),
  52 => seed_product_id(2),
  53 => seed_product_id(4),
  54 => seed_product_id(6),
  55 => seed_product_id(8),
  56 => seed_product_id(10),
  57 => seed_product_id(12),
  58 => seed_product_id(14),
  59 => seed_product_id(16),
  60 => seed_product_id(18),
  61 => seed_product_id(20),
  62 => seed_product_id(22),
  63 => seed_product_id(24),
  64 => seed_product_id(26),
  65 => seed_product_id(28),
  66 => seed_product_id(1),
  67 => seed_product_id(3),
  68 => seed_product_id(0),
  69 => seed_product_id(2),
  70 => seed_product_id(4),
  71 => seed_product_id(6),
  72 => seed_product_id(8),
  73 => seed_product_id(10),
  74 => seed_product_id(12),
  75 => seed_product_id(14),
  76 => seed_product_id(16),
  77 => seed_product_id(18),
  78 => seed_product_id(20),
  79 => seed_product_id(22),
  80 => seed_product_id(24),
  81 => seed_product_id(26),
  82 => seed_product_id(28),
  83 => seed_product_id(1),
  84 => seed_product_id(3),
  85 => seed_product_id(5),
  86 => seed_product_id(7),
}

review_num = 0
while review_num < REVIEW_TEXTS.length
  review = Review.find_by(
    reviewer_id: REVIEW_REVIEWER_IDS[review_num],
    product_id: REVIEW_PRODUCT_IDS[review_num]
  )

  if review && REVIEW_TEXTS[review_num]
    review.update_attributes!({
      text: REVIEW_TEXTS[review_num],
      rating: REVIEW_RATINGS[review_num],
      reviewer_id: REVIEW_REVIEWER_IDS[review_num],
      product_id: REVIEW_PRODUCT_IDS[review_num]
    })
  elsif REVIEW_TEXTS[review_num]
    review = Review.create!({
      text: REVIEW_TEXTS[review_num],
      rating: REVIEW_RATINGS[review_num],
      reviewer_id: REVIEW_REVIEWER_IDS[review_num],
      product_id: REVIEW_PRODUCT_IDS[review_num]
    })
  end

  review_num += 1
end

QUERY_QUERIER_IDS = {
  0 => seed_user_id(0),
}

QUERY_KEYWORDS = {
  0 => "clothing",
}

QUERY_SESSION_TOKENS = {
  0 => User.find(QUERY_QUERIER_IDS[0]).session_token,
}

query_num = 0
while query_num < QUERY_QUERIER_IDS.length
  query = Query.find_by(session_token: QUERY_SESSION_TOKENS[query_num])

  if query
    query.update_attributes!({
      querier_id: QUERY_QUERIER_IDS[query_num],
      keywords: QUERY_KEYWORDS[query_num],
      session_token: QUERY_SESSION_TOKENS[query_num]
    })
  else
    query = Query.create!({
      querier_id: QUERY_QUERIER_IDS[query_num],
      keywords: QUERY_KEYWORDS[query_num],
      session_token: QUERY_SESSION_TOKENS[query_num]
    })
  end

  query_num += 1
end

CART_BUYER_IDS = {
  0 => seed_user_id(0),
}

CART_SESSION_TOKENS = {
  0 => User.find(CART_BUYER_IDS[0]).session_token,
}

cart_num = 0
while cart_num < CART_BUYER_IDS.length
  cart = Cart.find_by(buyer_id: CART_BUYER_IDS[cart_num])

  if cart
    cart.update_attributes!({
      buyer_id: CART_BUYER_IDS[cart_num],
      session_token: CART_SESSION_TOKENS[cart_num]
    })
  else
    cart = Cart.create!({
      buyer_id: CART_BUYER_IDS[cart_num],
      session_token: CART_SESSION_TOKENS[cart_num]
    })
  end

  cart_num += 1
end

def seed_cart_id(cart_buyer_ids_key)
  Cart.find_by(buyer_id: CART_BUYER_IDS[cart_buyer_ids_key]).id
end

CART_PRODUCT_CART_IDS = {
  0 => seed_cart_id(0),
  1 => seed_cart_id(0),
  2 => seed_cart_id(0),
}

CART_PRODUCT_PRODUCT_IDS = {
  0 => seed_product_id(0),
  1 => seed_product_id(2),
  2 => seed_product_id(22),
}

CART_PRODUCT_QUANTITIES = {
  0 => 2,
  1 => 5,
  2 => 1,
}

cart_product_num = 0
while cart_product_num < CART_PRODUCT_CART_IDS.length
  cart_product = CartProduct.find_by(
    cart_id: CART_PRODUCT_CART_IDS[cart_product_num],
    product_id: CART_PRODUCT_PRODUCT_IDS[cart_product_num]
  )

  if cart_product
    cart_product.update_attributes!({
      cart_id: CART_PRODUCT_CART_IDS[cart_product_num],
      product_id: CART_PRODUCT_PRODUCT_IDS[cart_product_num],
      quantity: CART_PRODUCT_QUANTITIES[cart_product_num]
    })
  else
    cart_product = CartProduct.create!({
      cart_id: CART_PRODUCT_CART_IDS[cart_product_num],
      product_id: CART_PRODUCT_PRODUCT_IDS[cart_product_num],
      quantity: CART_PRODUCT_QUANTITIES[cart_product_num]
    })
  end

  cart_product_num += 1
end

ADDRESS_NAMES = {
  0 => User.find(seed_user_id(0)).name,
}

ADDRESS_STREETS = {
  0 => "123 Test Street",
}

ADDRESS_APTS = {
  0 => "1t",
}

ADDRESS_CITIES = {
  0 => "New Test City",
}

ADDRESS_STATES = {
  0 => "NY",
}

ADDRESS_ZIPS = {
  0 => "10001",
}

ADDRESS_USER_IDS = {
  0 => seed_user_id(0),
}

address_num = 0
while address_num < ADDRESS_NAMES.length
  address = Address.find_by(
    name: ADDRESS_NAMES[address_num],
    street: ADDRESS_STREETS[address_num],
    apt: ADDRESS_APTS[address_num],
    city: ADDRESS_CITIES[address_num],
    state: ADDRESS_STATES[address_num],
    zip: ADDRESS_ZIPS[address_num],
    user_id: ADDRESS_USER_IDS[address_num]
  )

  if address
    address.update_attributes!({
      name: ADDRESS_NAMES[address_num],
      street: ADDRESS_STREETS[address_num],
      apt: ADDRESS_APTS[address_num],
      city: ADDRESS_CITIES[address_num],
      state: ADDRESS_STATES[address_num],
      zip: ADDRESS_ZIPS[address_num],
      user_id: ADDRESS_USER_IDS[address_num]
    })

    User.find(address.user_id).update_attributes!({
      current_shipping_address_id: address.id,
      default_shipping_address_id: address.id
    })
  else
    address = Address.create!({
      name: ADDRESS_NAMES[address_num],
      street: ADDRESS_STREETS[address_num],
      apt: ADDRESS_APTS[address_num],
      city: ADDRESS_CITIES[address_num],
      state: ADDRESS_STATES[address_num],
      zip: ADDRESS_ZIPS[address_num],
      user_id: ADDRESS_USER_IDS[address_num]
    })

    User.find(address.user_id).update_attributes!({
      current_shipping_address_id: address.id,
      default_shipping_address_id: address.id
    })
  end

  address_num += 1
end

PURCHASE_BUYER_IDS = {
  0 => seed_user_id(0),
  1 => seed_user_id(0),
  2 => seed_user_id(0),
  3 => seed_user_id(0),
  4 => seed_user_id(0),
}

PURCHASE_PRODUCT_IDS = {
  0 => seed_product_id(5),
  1 => seed_product_id(7),
  2 => seed_product_id(9),
  3 => seed_product_id(11),
  4 => seed_product_id(13),
}

purchase_num = 0
while purchase_num < PURCHASE_BUYER_IDS.length
  purchase = Purchase.find_by(
    buyer_id: PURCHASE_BUYER_IDS[purchase_num],
    product_id: PURCHASE_PRODUCT_IDS[purchase_num]
  )

  if !purchase
    purchase = Purchase.create!({
      buyer_id: PURCHASE_BUYER_IDS[purchase_num],
      product_id: PURCHASE_PRODUCT_IDS[purchase_num]
    })
  end

  purchase_num += 1
end

STRIPE_CARD_USER_IDS = {
  0 => seed_user_id(0),
}

STRIPE_CARD_DETAILS = {
  0 => {
    name: User.find(STRIPE_CARD_USER_IDS[0]).name,
    number: 378282246310005,
    cvc: 1234,
    exp_month: 01,
    exp_year: 2020,
  },
}

stripe_num = 0
while stripe_num < STRIPE_CARD_USER_IDS.length
  user = User.find(STRIPE_CARD_USER_IDS[stripe_num])

  if !user.stripe_id
    stripe_token = Stripe::Token.create(
      card: STRIPE_CARD_DETAILS[stripe_num]
    )

    stripe_cus = Stripe::Customer.create(
      source: stripe_token.id,
      email: user.email
    )

    user.stripe_id = stripe_cus.id
    user.stripe_default_card_id = stripe_token.card.id
    user.save!
  else
    stripe_token = Stripe::Token.create(
      card: STRIPE_CARD_DETAILS[stripe_num]
    )

    p "HERE ONE"

    if !is_duplicate_card?(user.stripe_id, stripe_token)
      stripe_user = Stripe::Customer.retrieve(user.stripe_id)
      stripe_user.source = stripe_token.id
      stripe_user.save
      p "HERE TWO"
      user.stripe_default_card_id = stripe_token.card.id
      user.save!
    end
  end

  stripe_num += 1
end

def is_duplicate_card?(stripe_user_id, stripe_token)
  stripe_cards = Stripe::Customer
    .retrieve(stripe_user_id)
    .sources
    .all(object: "card")

  stripe_cards.each do |card|
    if card.name == stripe_token.card.name &&
      card.number == stripe_token.card.number &&
      card.cvc == stripe_token.card.cvc &&
      card.exp_month == stripe_token.card.exp_month &&
      card.exp_year == stripe_token.card.exp_year
        return true
    end
  end

  return false
end
