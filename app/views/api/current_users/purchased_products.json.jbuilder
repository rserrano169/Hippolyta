json.array! @purchased_products.each do |purchased_product|
  json.extract!(
    purchased_product,
    :name,
    :id,
    :seller_id,
    :sale_price,
    :original_price,
    :quantity,
    :description,
    :picture
  )

  json.seller_name(purchased_product.seller.name)

  json.thumb_picture_url image_url(purchased_product.picture.url(:thumb))
  json.small_picture_url image_url(purchased_product.picture.url(:small))
  json.medium_picture_url image_url(purchased_product.picture.url(:medium))
  json.large_picture_url image_url(purchased_product.picture.url(:large))
end
